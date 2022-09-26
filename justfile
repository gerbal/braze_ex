#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile deps`, for example.


postman_collection_id := "4689407-29829c45-e619-4c12-910f-564ec8ccfda9-SVYrsdsG"
version := `cat VERSION`
api_spec_path := "priv/openapi_spec.yaml"
postman_collection_path := "priv/postman_collection.json"


build:
    just deps
    just refresh-spec
    just fixup-spec
    just regenerate
    just prepare-readme

deps: 
    npm install
    go install github.com/mikefarah/yq/v4@latest
    
refresh-spec: 
    curl "https://www.postman.com/collections/{{postman_collection_id}}" | jq > {{postman_collection_path}}
    npm exec p2o {{postman_collection_path}} | yq -P > {{api_spec_path}} 
    just dump-api-description

dump-api-description:
    jq -r '.info.description' {{postman_collection_path}} >| API_DESCRIPTION.md


fixup-spec: 
    -just bump-version
    # set correct version in api spec
    VERSION=`cat VERSION` yq -iP '.info.version = strenv(VERSION)' {{api_spec_path}} 
    # Specs description is malformed when translated to readme
    yq -iP '.info.description = "Braze HTTP API (generated from Braze Postman Collection)"' {{api_spec_path}} 

bump-version: 
    # Version will only bump if api spec has unstaged changes
    ! git diff --exit-code {{postman_collection_path}}
    @echo {{version}}
    awk  -i inplace -F. '/[0-9]+\./{$NF++;print}BEGIN{OFS="."}' VERSION
    @echo "Openapi Spec has changed. Bumping Version from {{version}} to `cat VERSION`"

regenerate:
    npx "@openapitools/openapi-generator-cli" generate \
        --input-spec={{api_spec_path}} \
        --generator-name=elixir \
        --config=priv/openapi_config.yaml 
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
