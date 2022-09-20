#! /usr/bin/bash

# Get Collection from Postman

# Convert Open API
# libraries 
# - https://github.com/joolfe/postman-to-openapi - javascript
# - https://github.com/kevinswiber/postman2openapi - rust

# https://documenter.getpostman.com/view/4689407/SVYrsdsG?version=latest#intro


echo "## Installing utilities"

curl https://raw.githubusercontent.com/OpenAPITools/openapi-generator/master/bin/utils/openapi-generator-cli.sh > bin/openapi-generator-cli
chmod u+x bin/openapi-generator-cli

npm install

POSTMAN_COLLECTION_ID=4689407-29829c45-e619-4c12-910f-564ec8ccfda9-SVYrsdsG

curl "https://www.postman.com/collections/$POSTMAN_COLLECTION_ID" | jq > priv/postman_collection.json

# 2 postman to open api options

# postman-to-openapi
npm exec p2o priv/postman_collection.json > priv/p2o_spec.yaml 

# postman2openapi
# bin/postman2openapi priv/postman_collection.json > priv/postman2openapi_spec.yaml

# Generate Library

bin/openapi-generator-cli generate --input-spec=priv/p2o_spec.yaml --generator-name elixir --output lib/p2o
# bin/openapi-generator-cli generate --input-spec=priv/postman2openapi_spec.yaml --generator-name elixir --output lib/postman2openapi


# Options to pass - packageName=braze_ex