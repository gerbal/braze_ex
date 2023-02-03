# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.CatalogsCatalogItemsAsynchronous do
  @moduledoc """
  API calls for all endpoints tagged `CatalogsCatalogItemsAsynchronous`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## Delete Multiple Catalog Items

  Use this endpoint to delete multiple items in your catalog. Each request can support up to 50 items. This endpoint is asynchronous.

  ## Rate limit

  This endpoint has a shared rate limit of 100 requests per minute between all asynchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain an `id` referencing the items Braze should delete. Up to 50 item objects are allowed per request. |

  ## Example request

  ```
  curl --location --request DELETE 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {"id": "restaurant1"},
    {"id": "restaurant2"},
    {"id": "restaurant3"}
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `202`, `400`, and `404`.

  ### Example success response

  The status code `202` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "items-missing-ids",
      "message": "There are 1 item(s) that do not have ids",
      "parameters": [],
      "parameter_values": []
    }
  ],
  "message": "Invalid Request",
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog-not-found` | Check that the catalog name is valid. |
  | `request-includes-too-many-items` | Your request has too many items. The item limit per request is 50. |
  | `invalid-ids` | Item IDs can only include letters, numbers, hyphens, and underscores. |
  | `ids-too-large` | Item IDs can't be more than 250 characters. |
  | `ids-not-unique` | Check that the item IDs are unique in the request. |
  | `ids-not-strings` | Item IDs must be of type string. |
  | `items-missing-ids` | There are items that do not have item IDs. Check that each item has an item ID. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_delete(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_delete(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:delete)
      |> url("/catalogs/#{catalog_name}/items")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Edit Multiple Catalog Items

  Use this endpoint to edit multiple items in your catalog. Each request can support up to 50 items. This endpoint is asynchronous.

  ## Rate limit

  This endpoint has a shared rate limit of 100 requests per minute between all asynchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain fields that exist in the catalog. Up to 50 item objects are allowed per request. |

  ## Example request

  ```
  curl --location --request PATCH 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {
      "id": "restaurant1",
      "Name": "Restaurant",
      "Loyalty_Program": false,
      "Open_Time": "2021-09-03T09:03:19.967+00:00"
    },
    {
      "id": "restaurant3",
      "City": "San Francisco",
      "Rating": 2
    }
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `202`, `400`, and `404`.

  ### Example success response

  The status code `202` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "invalid-fields",
      "message": "Some of the fields given do not exist in the catalog",
      "parameters": [
        "id"
      ],
      "parameter_values": [
        "restaurant1"
      ]
    }
  ],
  "message": "Invalid Request"
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog-not-found` | Check that the catalog name is valid. |
  | `item-array-invalid` | `items` must be an array of objects. |
  | `request-includes-too-many-items` | Your request has too many items. The item limit per request is 50. |
  | `invalid-ids` | Item IDs can only include letters, numbers, hyphens, and underscores. |
  | `ids-too-large` | Item IDs can't be more than 250 characters. |
  | `ids-not-unique` | Item IDs must be unique in the request. |
  | `ids-not-strings` | Item IDs must be of type string. |
  | `items-missing-ids` | There are items that do not have item IDs. Check that each item has an item ID. |
  | `items-too-large` | Item values can't exceed 5,000 characters. |
  | `invalid-fields` | Confirm that the fields in the request exist in the catalog. |
  | `unable-to-coerce-value` | Item types can't be converted. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_patch(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_patch(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:patch)
      |> url("/catalogs/#{catalog_name}/items")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Create Multiple Catalog Items

  Use this endpoint to create multiple items in your catalog. Each request can support up to 50 items. This endpoint is asynchronous.

  ## Rate limit

  This endpoint has a shared rate limit of 100 requests per minute between all asynchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain all of the fields in the catalog. Up to 50 item objects are allowed per request. |

  ## Example Request

  ```
  curl --location --request POST 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {
      "id": "restaurant1",
      "Name": "Restaurant1",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 5,
      "Loyalty_Program": true,
      "Created_At": "2022-11-01T09:03:19.967+00:00"
    },
    {
      "id": "restaurant2",
      "Name": "Restaurant2",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 10,
      "Loyalty_Program": true,
      "Created_At": "2022-11-02T09:03:19.967+00:00"
    },
    {
      "id": "restaurant3",
      "Name": "Restaurant3",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 3,
      "Loyalty_Program": false,
      "Created_At": "2022-11-03T09:03:19.967+00:00"
    }
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `202`, `400`, and `404`.

  ### Example success response

  The status code `202` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "fields-do-not-match",
      "message": "Fields do not match with fields on the catalog",
      "parameters": [
        "id"
      ],
      "parameter_values": [
        "restaurant2"
      ]
    }
  ],
  "message": "Invalid Request"
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog-not-found` | Check that the catalog name is valid. |
  | `item-array-invalid` | `items` must be an array of objects. |
  | `request-includes-too-many-items` | Your request has too many items. The item limit per request is 50. |
  | `invalid-ids` | Item IDs can only include letters, numbers, hyphens, and underscores. |
  | `ids-too-large` | Item IDs can't be more than 250 characters. |
  | `ids-not-unique` | Item IDs must be unique in the request. |
  | `ids-not-strings` | Item IDs must be of type string. |
  | `items-missing-ids` | There are items that do not have item IDs. Check that each item has an item ID. |
  | `items-too-large` | Item values can't exceed 5,000 characters. |
  | `invalid-fields` | Confirm that the fields in the request exist in the catalog. |
  | `fields-do-not-match` | Updated fields must match the fields in the catalog. |
  | `unable-to-coerce-value` | Item types can't be converted. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_post(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_post(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/catalogs/#{catalog_name}/items")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
