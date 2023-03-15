# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.CatalogsCatalogItemsSynchronous do
  @moduledoc """
  API calls for all endpoints tagged `CatalogsCatalogItemsSynchronous`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## List Multiple Catalog Item Details

  Use this endpoint to return multiple catalog items and their content.

  ## Rate limit

  This endpoint has a shared rate limit of 50 requests per minute between all synchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Query parameters

  Note that each call to this endpoint will return 50 items. For a catalog with more than 50 items, use the `Link` header to retrieve the data on the next page as shown in the following example response.

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `cursor` | Optional | String | Determines the pagination of the catalog items. |

  ## Example requests

  ### Without cursor

  ```
  curl --location --request GET 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY'

  ```

  ### With cursor

  ```
  curl --location --request GET 'https://rest.iad-03.braze.com/catalogs/restaurants/items?cursor=c2tpcDow' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY'

  ```

  ## Response

  There are three status code responses for this endpoint: `200`, `400`, and `404`.

  ### Example success response

  The status code `200` could return the following response header and body.

  {% alert note %}  
  The `Link` header won't exist if the catalog has less than or equal to 50 items. For calls without a cursor, `prev` will not show. When looking at the last page of items, `next` will not show.  
  {% endalert %}

  ```
  Link: ; rel="prev",; rel="next"

  ```

  ``` json
  {
  "items": [
    {
      "id": "restaurant1",
      "Name": "Restaurant1",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 5,
      "Loyalty_Program": true,
      "Open_Time": "2022-11-02T09:03:19.967Z"
    },
    {
      "id": "restaurant2",
      "Name": "Restaurant2",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 10,
      "Loyalty_Program": true,
      "Open_Time": "2022-11-02T09:03:19.967Z"
    },
    {
      "id": "restaurant3",
      "Name": "Restaurant3",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 5,
      "Loyalty_Program": false,
      "Open_Time": "2022-11-02T09:03:19.967Z"
    }
  ],
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "invalid-cursor",
      "message": "'cursor' is not valid",
      "parameters": [
        "cursor"
      ],
      "parameter_values": [
        "bad-cursor"
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
  | `invalid-cursor` | Check that your `cursor` is valid. |
  | `catalog-not-found` | Check that the catalog name is valid. |

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
  @spec catalogs_catalog_name_items_get(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_get(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/catalogs/#{catalog_name}/items")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Delete a Catalog Item

  Use this endpoint to delete an item in your catalog.

  ## Rate limit

  This endpoint has a shared rate limit of 50 requests per minute between all synchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |
  | `item_id` | Required | String | The ID of the catalog item. |

  ## Request parameters

  There is no request body for this endpoint.

  ## Example request

  ```
  curl --location --request DELETE 'https://rest.iad-03.braze.com/catalogs/restaurants/items/restaurant1' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY'

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
      "id": "item-not-found",
      "message": "Could not find item",
      "parameters": [
        "item_id"
      ],
      "parameter_values": [
        "restaurant34"
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
  | `item-not-found` | Check that the item to be deleted exists in your catalog. |
  | `arbitrary-error` | An arbitrary error occurred. Please try again or contact [Support]({{site.baseurl}}/support_contact/). |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `item_id` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_item_id_delete(
          Tesla.Env.client(),
          String.t(),
          String.t(),
          keyword()
        ) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_item_id_delete(connection, catalog_name, item_id, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:delete)
      |> url("/catalogs/#{catalog_name}/items/#{item_id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## List Catalog Item Details

  Use this endpoint to return a catalog item and its content.

  ## Rate limit

  This endpoint has a shared rate limit of 50 requests per minute between all synchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |
  | `item_id` | Required | String | The ID of the catalog item. |

  ## Request parameters

  There is no request body for this endpoint.

  ## Example request

  ```
  curl --location --request GET 'https://rest.iad-03.braze.com/catalogs/restaurants/items/restaurant1' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY'

  ```

  ## Response

  There are two status code responses for this endpoint: `200` and `404`.

  ### Example success response

  The status code `200` could return the following response body.

  ``` json
  {
  "items": [
    {
      "id": "restaurant3",
      "Name": "Restaurant1",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 5,
      "Loyalty_Program": true,
      "Open_Time": "2022-11-01T09:03:19.967Z"
    }
  ],
  "message": "success"
  }

  ```

  ### Example error response

  The status code `404` could return the following response. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "item-not-found",
      "message": "Could not find item",
      "parameters": [
        "item_id"
      ],
      "parameter_values": [
        "restaurant34"
      ]
    }
  ],
  "message": "Invalid Request"
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps, if applicable.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog-not-found` | Check that the catalog name is valid. |
  | `item-not-found` | Check that the item is in the catalog. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `item_id` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_item_id_get(
          Tesla.Env.client(),
          String.t(),
          String.t(),
          keyword()
        ) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_item_id_get(connection, catalog_name, item_id, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/catalogs/#{catalog_name}/items/#{item_id}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Edit Catalog Items

  Use this endpoint to edit an item in your catalog.

  ## Rate Limit

  This endpoint has a shared rate limit of 50 requests per minute between all synchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |
  | `item_id` | Required | String | The ID of the catalog item. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain fields that exist in the catalog except for the `id` field. Only one item object is allowed per request. |

  ## Example request

  ```
  curl --location --request PATCH 'https://rest.iad-03.braze.com/catalogs/restaurants/items/restaurant1' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {
      "Name": "Restaurant",
      "Loyalty_Program": false,
      "Open_Time": "2021-09-03T09:03:19.967+00:00"
    }
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `200`, `400`, and `404`.

  ### Example success response

  The status code `200` could return the following response body.

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
  | `item-not-found` | Check that the item is in the catalog. |
  | `item-array-invalid` | `items` must be an array of objects. |
  | `request-includes-too-many-items` | You can only edit one catalog item per request. |
  | `id-in-body` | An item ID already exists in the catalog. |
  | `invalid-ids` | Supported characters for item ID names are letters, numbers, hyphens, and underscores. |
  | `ids-too-large` | Character limit for each item ID is 250 characters. |
  | `items-too-large` | Character limit for each item is 5,000 characters. |
  | `invalid-fields` | Confirm that the fields in the request exist in the catalog. |
  | `unable-to-coerce-value` | Item types can't be converted. |
  | `filtered-set-field-too-long` | The field value is being used in a filtered set that exceeds the character limit for an item. |
  | `arbitrary-error` | An arbitrary error occurred. Please try again or contact [Support]({{site.baseurl}}/support_contact/). |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `item_id` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_item_id_patch(
          Tesla.Env.client(),
          String.t(),
          String.t(),
          keyword()
        ) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_item_id_patch(connection, catalog_name, item_id, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:patch)
      |> url("/catalogs/#{catalog_name}/items/#{item_id}")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Create Catalog Item

  Use this endpoint to create an item in your catalog.

  ## Rate limit

  This endpoint has a shared rate limit of 50 requests per minute between all synchronous catalog item endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |
  | `item_id` | Required | String | The ID of the catalog item. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain all of the fields in the catalog except for the `id` field. Only one item object is allowed per request. |

  ## Example Request

  ```
  curl --location --request POST 'https://rest.iad-03.braze.com/catalogs/restaurants/items/restaurant1' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {
      "Name": "Restaurant1",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 5,
      "Loyalty_Program": true,
      "Created_At": "2022-11-01T09:03:19.967+00:00"
    }
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `201`, `400`, and `404`.

  ### Example success response

  The status code `201` could return the following response body.

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
  | `request-includes-too-many-items` | You can only create one catalog item per request. |
  | `id-in-body` | Remove any item IDs in the request body. |
  | `invalid-ids` | Supported characters for item ID names are letters, numbers, hyphens, and underscores. |
  | `ids-too-large` | Character limit for each item ID is 250 characters. |
  | `items-too-large` | Character limit for each item is 5,000 characters. |
  | `item-already-exists` | The item already exists in the catalog. |
  | `invalid-fields` | Confirm that the fields in the request exist in the catalog. |
  | `fields-do-not-match` | Fields must match the fields in the catalog. |
  | `filtered-set-field-too-long` | The field value is being used in a filtered set that exceeds the character limit for an item. |
  | `already-reached-catalog-item-limit` | Maximum number of catalogs reached. Contact your Braze account manager for more information. |
  | `already-reached-company-item-limit` | Maximum number of catalog items reached. Contact your Braze account manager for more information. |
  | `unable-to-coerce-value` | Item types can't be converted. |
  | `arbitrary-error` | An arbitrary error occurred. Please try again or contact [Support]({{site.baseurl}}/support_contact/). |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `item_id` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_item_id_post(
          Tesla.Env.client(),
          String.t(),
          String.t(),
          keyword()
        ) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_item_id_post(connection, catalog_name, item_id, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/catalogs/#{catalog_name}/items/#{item_id}")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
