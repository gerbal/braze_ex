# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile deps`, for example.

postman_collection_id := "4689407-29829c45-e619-4c12-910f-564ec8ccfda9-SVYrsdsG"
version := `cat VERSION`
api_spec_path := "priv/openapi_spec.yaml"

deps: 
    npm install
    curl https://raw.githubusercontent.com/OpenAPITools/openapi-generator/master/bin/utils/openapi-generator-cli.sh > bin/openapi-generator-cli
    chmod u+x bin/openapi-generator-cli
    go install github.com/mikefarah/yq/v4@latest
    
refresh: 
    curl "https://www.postman.com/collections/{{postman_collection_id}}" | jq > priv/postman_collection.json
    npm exec p2o priv/postman_collection.json | yq -P > {{api_spec_path}} 


bump-version: 
    # Bail if api spec is unchanged
    ! git diff --exit-code {{api_spec_path}}
    @echo {{version}}
    awk  -i inplace -F. '/[0-9]+\./{$NF++;print}BEGIN{OFS="."}' VERSION
    @echo "Openapi Spec has changed. Bumping Version from {{version}} to `cat VERSION`"

fixup-spec: 
    -just bump-version
    # Set correct version in api spec
    VERSION=`cat VERSION` yq -iP '.info.version = strenv(VERSION)' {{api_spec_path}} 
    # Specs description is malformed when translated to readme
    yq -iP '.info.description = "# Braze HTTP API"' {{api_spec_path}} 

regenerate-client: fixup-spec
    bin/openapi-generator-cli generate \
        --input-spec={{api_spec_path}} \
        --generator-name elixir \
        --additional-properties=packageName=braze_ex,invokerPackage=BrazeEx,disallowAdditionalPropertiesIfNotPresent=false
    echo "node_modules" >> .gitignore
    echo "bin" >> .gitignore