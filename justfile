#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile deps`, for example.


postman_collection_id := "4689407-29829c45-e619-4c12-910f-564ec8ccfda9-SVYrsdsG"
version := `cat VERSION`
api_spec_path := "priv/openapi_spec.yaml"
postman_collection_path := "priv/postman_collection.json"

deps: 
    npm install
    curl https://raw.githubusercontent.com/OpenAPITools/openapi-generator/master/bin/utils/openapi-generator-cli.sh > bin/openapi-generator-cli
    chmod u+x bin/openapi-generator-cli
    go install github.com/mikefarah/yq/v4@latest
    
refresh: 
    curl "https://www.postman.com/collections/{{postman_collection_id}}" | jq > {{postman_collection_path}}
    npm exec p2o {{postman_collection_path}} | yq -P > {{api_spec_path}} 

bump-version: 
    # Version will only bump if api spec has unstaged changes
    ! git diff --exit-code {{postman_collection_path}}
    @echo {{version}}
    awk  -i inplace -F. '/[0-9]+\./{$NF++;print}BEGIN{OFS="."}' VERSION
    @echo "Openapi Spec has changed. Bumping Version from {{version}} to `cat VERSION`"

#  TODO Inject usage instructions in Readme instead of Postman instructions
inject-docs-description:
    echo "" >> README.md
    jq -r '.info.description' {{postman_collection_path}} >> README.md


# mix_file_links := ',\n      links: %{github: "https\:\/\/github.com\/gerbal\/braze_ex"'
mix_file_links := ',\n      links: %{github: "https\:\/\/github.com\/gerbal\/braze_ex"}'
inject-links-in-mix:
    sed -i 's/\(\["MIT"\]\)$/\1{{mix_file_links}}/' mix.exs 

fixup-spec: 
    -just bump-version
    # set correct version in api spec
    VERSION=`cat VERSION` yq -iP '.info.version = strenv(VERSION)' {{api_spec_path}} 
    # Specs description is malformed when translated to readme
    yq -iP '.info.description = "Braze HTTP API (generated from Braze Postman Collection)"' {{api_spec_path}} 

regenerate:
    bin/openapi-generator-cli generate \
        --input-spec={{api_spec_path}} \
        --generator-name elixir \
        --additional-properties=packageName=braze_ex,invokerPackage=BrazeEx,disallowAdditionalPropertiesIfNotPresent=false,licenseId=MIT
    @echo "node_modules" >> .gitignore
    @echo "bin" >> .gitignore
    just inject-links-in-mix
    mix format
    # just inject-docs-description

build:
    just deps
    just refresh
    just fixup-spec
    just regenerate


publish:
    #!/usr/bin/env bash
    if ! git diff-index --quiet HEAD --; then
        mix hex.publish
        git add .
        git commit -m "🤖 Version Bump to `cat VERSION`"
        git push
    else
        echo "No Changes to publish"
    fi
