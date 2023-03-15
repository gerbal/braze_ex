# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.CatalogsCatalogManagementSynchronous do
  @moduledoc """
  API calls for all endpoints tagged `CatalogsCatalogManagementSynchronous`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## Delete Catalog

  Use this endpoint to delete a catalog.

  ## Rate limit

  This endpoint has a shared rate limit of 5 requests per minute between all synchronous catalog endpoints.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Response

  There are two status code responses for this endpoint: `200` and `404`.

  ### Example success response

  The status code `200` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `404` could return the following response body. Refer to [Troubleshooting](https://www.braze.com/docs/api/endpoints/catalogs/catalog_management/synchronous/delete_catalog/#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "catalog-not-found",
      "message": "Could not find catalog",
      "parameters": [
        "catalog_name"
      ],
      "parameter_values": [
        "restaurants"
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
  @spec catalogs_catalog_name_delete(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_delete(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:delete)
      |> url("/catalogs/#{catalog_name}")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## List Catalogs in App Group

  Use this endpoint to return a list of catalogs in an app group.

  ## Path and request parameters

  There are no path or request parameters for this endpoint.

  ## Response

  ### Example success response

  The status code `200` could return the following response body.

  ``` json
  {
  "catalogs": [
    {
      "description": "My Restaurants",
      "fields": [
        {
          "name": "id",
          "type": "string"
        },
        {
          "name": "Name",
          "type": "string"
        },
        {
          "name": "City",
          "type": "string"
        },
        {
          "name": "Cuisine",
          "type": "string"
        },
        {
          "name": "Rating",
          "type": "number"
        },
        {
          "name": "Loyalty_Program",
          "type": "boolean"
        },
        {
          "name": "Created_At",
          "type": "time"
        }
      ],
      "name": "restaurants",
      "num_items": 10,
      "updated_at": "2022-11-02T20:04:06.879+00:00"
    },
    {
      "description": "My Catalog",
      "fields": [
        {
          "name": "id",
          "type": "string"
        },
        {
          "name": "string_field",
          "type": "string"
        },
        {
          "name": "number_field",
          "type": "number"
        },
        {
          "name": "boolean_field",
          "type": "boolean"
        },
        {
          "name": "time_field",
          "type": "time"
        },
      ],
      "name": "my_catalog",
      "num_items": 3,
      "updated_at": "2022-11-02T09:03:19.967+00:00"
    },
  ],
  "message": "success"
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_get(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_get(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/catalogs")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Create Catalog

  Use this endpoint to create a catalog.

  ## Rate limit

  This endpoint has a shared rate limit of 5 requests per minute between all synchronous catalog endpoints.

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalogs` | Required | Array | An array that contains catalog objects. Only one catalog object is allowed for this request. |

  ### Catalog object parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `name` | Required | String | The name of the catalog that you want to create. |
  | `description` | Required | String | The description of the catalog that you want to create. |
  | `fields` | Required | Array | An array of objects where the object contains keys `name` and `type`. |

  ## Example Request

  ```
  curl --location --request POST 'https://rest.iad-03.braze.com/catalogs' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "catalogs": [
    {
      "name": "restaurants",
      "description": "My Restaurants",
      "fields": [
        {
          "name": "id",
          "type": "string"
        },
        {
          "name": "Name",
          "type": "string"
        },
        {
          "name": "City",
          "type": "string"
        },
        {
          "name": "Cuisine",
          "type": "string"
        },
        {
          "name": "Rating",
          "type": "number"
        },
        {
          "name": "Loyalty_Program",
          "type": "boolean"
        },
        {
          "name": "Created_At",
          "type": "time"
        }
      ]
    }
  ]
  }'

  ```

  ## Response

  There are two status code responses for this endpoint: `201` and `400`.

  ### Example success response

  The status code `201` could return the following response body.

  ``` json
  {
  "catalogs": [
    {
      "description": "My Restaurants",
      "fields": [
        {
          "name": "id",
          "type": "string"
        },
        {
          "name": "Name",
          "type": "string"
        },
        {
          "name": "City",
          "type": "string"
        },
        {
          "name": "Cuisine",
          "type": "string"
        },
        {
          "name": "Rating",
          "type": "number"
        },
        {
          "name": "Loyalty_Program",
          "type": "boolean"
        },
        {
          "name": "Created_At",
          "type": "time"
        }
      ],
      "name": "restaurants",
      "num_items": 0,
      "updated_at": "2022-11-02T20:04:06.879+00:00"
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
      "id": "catalog-name-already-exists",
      "message": "A catalog with that name already exists",
      "parameters": [
        "name"
      ],
      "parameter_values": [
        "restaurants"
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
  | `catalog-array-invalid` | `catalogs` must be an array of objects. |
  | `too-many-catalog-atoms` | You can only create one catalog per request. |
  | `invalid_catalog_name` | Catalog name can only include letters, numbers, hyphens, and underscores. |
  | `catalog-name-too-large` | Character limit for a catalog name is 250. |
  | `catalog-name-already-exists` | Catalog with that name already exists. |
  | `id-not-first-column` | The `id` must be the first field in the array. Check that the type is a string. |
  | `invalid-fields` | `fields` is not formatted correctly. |
  | `too-many-fields` | Number of fields limit is 30. |
  | `invalid-field-names` | Fields can only include letters, numbers, hyphens, and underscores. |
  | `invalid-field-types` | Make sure the field types are valid. |
  | `field-names-too-large` | Character limit for a field name is 250. |
  | `field-names-not-unique` | The same field name is referenced twice. |
  | `reached-company-catalogs-limit` | Maximum number of catalogs reached. Contact your Braze account manager for more information. |
  | `description-too-long` | Character limit for description is 250. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_post(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/catalogs")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
