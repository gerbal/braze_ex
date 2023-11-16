#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile deps`, for example.


postman_collection_id := "4689407-29829c45-e619-4c12-910f-564ec8ccfda9-SVYrsdsG"
version := `cat VERSION`
api_spec_path := "priv/openapi_spec.yaml"
postman_path := "priv/postman_collection.json"
braze_swagger_path := "/tmp/braze_swagger.json"


build:
    just deps
    just refresh-postman
    just fetch-api-info
    just postman-to-openapi
    just set-missing-content-types
    just fixup-postman-spec
    just regenerate
    just prepare-readme
    just prepare-release

prepare-release:
    just bump-version
    just fixup-postman-spec
    just regenerate
    just prepare-readme

changed:
    ! git update-index --refresh
    ! git diff-index --quiet HEAD lib && git diff-index --quiet HEAD {{postman_path}}
    @echo {{version}}

deps: 
    npm install
    go install github.com/mikefarah/yq/v4@latest

fetch-api-info:
    curl https://www.braze.com/docs/assets/js/swagger/braze_swagger.json | yq >| {{braze_swagger_path}}
    SERVERS=`cat {{braze_swagger_path}} | jq '.servers'` yq -o json -i '.servers = env(SERVERS)' p2o.json
    AUTH=`cat {{braze_swagger_path}} | jq '.components.securitySchemes'` yq -o json -i '.auth = env(AUTH)' p2o.json
    
refresh-postman: 
    curl "https://www.postman.com/collections/{{postman_collection_id}}" | jq >| {{postman_path}}
    sed -i 's/\}\} \//\}\}\//g' {{postman_path}}
    jq -r '.info.description' {{postman_path}} >| API_DESCRIPTION.md

postman-to-openapi:
    npm exec p2o -- {{postman_path}} -o p2o.json | yq -P  >| {{api_spec_path}} 
    
fixup-postman-spec: 
    VERSION=`cat VERSION` yq -iP '.info.version = strenv(VERSION)' {{api_spec_path}}
    yq -iP '.info.description = "Braze HTTP API (generated from Braze Postman Collection)"' {{api_spec_path}} 

# 2023-02-03 - Postman collection is missing Content types for these resources, stub them with an empty string
set-missing-content-types:
    yq -iP '.paths."/catalogs/{catalog_name}/items".patch.requestBody.content = {"*/*": {"schema": {"type": "string"}}}' {{api_spec_path}} 
    yq -iP '.paths."/catalogs".post.requestBody.content = {"*/*": {"schema": {"type": "string"}}}' {{api_spec_path}} 
    yq -iP '.paths."/catalogs/{catalog_name}/items".post.requestBody.content = {"*/*": {"schema": {"type": "string"}}}' {{api_spec_path}} 

bump-version: 
    # Version will only bump if api spec has unstaged changes
    just changed
    @echo {{version}}
    awk  -i inplace -F. '/[0-9]+\./{$NF++;print}BEGIN{OFS="."}' VERSION
    @echo "Openapi Spec has changed. Bumping Version from {{version}} to `cat VERSION`"

regenerate:
    npx "@openapitools/openapi-generator-cli" generate \
        --input-spec={{api_spec_path}} \
        --generator-name=elixir \
        --skip-validate-spec \
        --config=priv/openapi_config.yaml 
    just elixir
    mix format
    
prepare-readme:
    printf "\n" >> README.md
    cat USAGE.md >> README.md
    printf "\n" >> README.md
    cat DEVELOPMENT.md >> README.md

elixir:
    mix local.hex --force
    mix deps.get

publish:elixir
    #!/usr/bin/env bash
    if ! git diff-index --quiet HEAD --; then
        mix deps.get
        mix hex.publish --yes
        git commit -am "🤖 Version Bump to `cat VERSION`"
        git push
    else
        echo "No Changes to publish"
    fi
