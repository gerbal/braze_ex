# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.SCIM do
  @moduledoc """
  API calls for all endpoints tagged `SCIM`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## Search Existing Dashboard User by Email

  This endpoint allows you to look up an existing dashboard user account by specifying their email in the filter query parameter. Note that when the query parameter is URL encoded it will read like this:

  `/scim/v2/Users?filter=userName eq "user@test.com"`

  For information on how to obtain a SCIM token, visit [Automated user provisioning](https://www.braze.com/docs/scim/automated_user_provisioning/).

  ## Rate limit

  This endpoint has a rate limit of 5000 requests per day, per company. This rate limit is shared with the `/scim/v2/Users/` PUT, GET, DELETE, and POST endpoints as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  X-Request-Origin: YOUR-REQUEST-ORIGIN-HERE
  Authorization: Bearer YOUR-SCIM-TOKEN-HERE
  {
    "schemas": ["urn:ietf:params:scim:api:messages:2.0:ListResponse"],
    "totalResults": 1,
    "Resources": [
        {
            "userName": "user@test.com",
            "id": "dfa245b7-24195aec-887bb3ad-602b3340",
            "name": {
                "givenName": "Test",
                "familyName": "User"
            },
            "department": "finance",
            "lastSignInAt": "Thursday, January 1, 1970 12:00:00 AM",
            "permissions": {
                "companyPermissions": ["manage_company_settings"],
                "appGroup": [
                    {
                        "appGroupId": "241adcd25789fabcded",
                        "appGroupName": "Test App Group",
                        "appGroupPermissions": ["basic_access","send_campaigns_canvases"],
                        "team": [
                            {
                                "teamId": "241adcd25789fabcded",
                                "teamName": "Test Team",                  
                                "teamPermissions": ["admin"]
                            }
                        ]
                    } 
                ]
            }
        }
    ]
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:x_request_origin` (String.t): 
    - `:authorization` (String.t): 
    - `:filter` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec scim_v2_users_get(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def scim_v2_users_get(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :"X-Request-Origin" => :headers,
      :Authorization => :headers,
      :filter => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/scim/v2/Users")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Create New Dashboard User Account

  This endpoint allows you to create a new dashboard user account by specifying email, given and family names, permissions (for setting permissions at the company, app group, and team level). For information on how to obtain a SCIM token, visit [Automated user provisioning](https://www.braze.com/docs/scim/automated_user_provisioning/).

  ## Rate limit

  This endpoint has a rate limit of 5000 requests per day, per company. This rate limit is shared with the `/scim/v2/Users/` PUT, GET, and DELETE endpoints as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Request parameters

  | Parameter | Required | Data type | Description |
  | --- | --- | --- | --- |
  | `schemas` | Required | Array of strings | Expected SCIM 2.0 schema name for user object. |
  | `userName` | Required | String | The user’s email address. |
  | `name` | Required | JSON object | This object contains the user's given name and family name. |
  | `department` | Required | String | Valid department string from the [department string documentation]({{site.baseurl}}/scim_api_appendix/#department-strings). |
  | `permissions` | Required | JSON object | Permissions object as described in the [permissions object documentation]({{site.baseurl}}/scim_api_appendix/#permissions-object). |


  ## Response

  ```json
  {
    "schemas": ["urn:ietf:params:scim:schemas:core:2.0:User"],
    "id": "dfa245b7-24195aec-887bb3ad-602b3340",
    "userName": "user@test.com",
    "name": {
        "givenName": "Test",
        "familyName": "User"
    },
    "department": "finance",
    "lastSignInAt": "Thursday, January 1, 1970 12:00:00 AM",
    "permissions": {
        "companyPermissions": ["manage_company_settings"],
        "appGroup": [
            {
                "appGroupId": "241adcd25789fabcded",
                "appGroupName": "Test App Group",
                "appGroupPermissions": ["basic_access","send_campaigns_canvases"],
                "team": [
                    {
                         "teamId": "2519dafcdba238ae7",
                         "teamName": "Test Team",                  
                         "teamPermissions": ["basic_access","export_user_data"]
                    }
                ]
            } 
        ]
    }
  }
  ```

  ### Error states

  If a user with this email address already exists in Braze, the endpoint will respond with:

  ```json
  HTTP/1.1 409 Conflict
  Date: Tue, 10 Sep 2019 02:22:30 GMT
  Content-Type: text/json;charset=UTF-8

  {
  "schemas": ["urn:ietf:params:scim:api:messages:2.0:Error"],
  "detail": "User already exists in the database.",
  "status": 409
  }
  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:x_request_origin` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec scim_v2_users_post(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def scim_v2_users_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :"X-Request-Origin" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/scim/v2/Users")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Remove Dashboard User Account

  This endpoint allows you to permanently delete an existing dashboard user by specifying the resource `id` returned by the SCIM [`POST`](https://www.braze.com/docs/scim/post_create_user_account/) method. This is similar to deleting a user in the **Manage Users** section of the Braze dashboard. For information on how to obtain a SCIM token, visit [Automated user provisioning](https://www.braze.com/docs/scim/automated_user_provisioning/).

  ## Rate limit

  This endpoint has a rate limit of 5000 requests per day, per company. This rate limit is shared with the `/scim/v2/Users/` PUT, GET, and POST endpoints as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Request parameters

  | Parameter | Required | Data type | Description |
  | --- | --- | --- | --- |
  | `id` | Required | String | The user’s resource ID. This parameter is returned by the `POST` `/scim/v2/Users/` or `GET` `/scim/v2/Users?filter=userName eq "[user@test.com](mailto:user@test.com)"` methods. |

  ## Response

  ``` json
  HTTP/1.1 204 Not Found
  Content-Type: text/html; charset=UTF-8

  ```

  ## Error states

  If a developer with this ID doesn’t exist in Braze, the endpoint will respond with:

  ``` json
  HTTP/1.1 404 Not Found Content-Type: text/html; charset=UTF-8
  { "schemas": ["urn:ietf:params:scim:api:messages:2.0:Error"], "detail": "User not found", "status": 404 }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:x_request_origin` (String.t): 
    - `:authorization` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec scim_v2_users_youridhere_delete(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def scim_v2_users_youridhere_delete(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :"X-Request-Origin" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:delete)
      |> url("/scim/v2/Users/YOUR_ID_HERE")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Look Up an Existing Dashboard User Account

  This endpoint allows you to look up an existing dashboard user account by specifying the resource `id` returned by the SCIM [`POST`](https://www.braze.com/docs/scim/post_create_user_account/) method. For information on how to obtain a SCIM token, visit [Automated user provisioning](https://www.braze.com/docs/scim/automated_user_provisioning/).

  ## Rate limit

  This endpoint has a rate limit of 5000 requests per day, per company. This rate limit is shared with the `/scim/v2/Users/` PUT, GET, DELETE, and POST endpoints as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Request parameters

  | Parameter | Required | Data type | Description |
  | --- | --- | --- | --- |
  | `id` | Required | String | The user’s resource ID. This parameter is returned by the `POST` `/scim/v2/Users/` or `GET` `/scim/v2/Users?filter=userName eq "user@test.com"` methods. |

  ## Response

  ``` json
  {
    "schemas": ["urn:ietf:params:scim:schemas:core:2.0:User"],
    "id": "dfa245b7-24195aec-887bb3ad-602b3340",
    "userName": "user@test.com",
    "name": {
        "givenName": "Test",
        "familyName": "User"
    },
    "department": "finance",
    "lastSignInAt": "Thursday, January 1, 1970 12:00:00 AM",
    "permissions": {
        "companyPermissions": ["manage_company_settings"],
        "appGroup": [
            {
                "appGroupId": "241adcd25789fabcded",
                "appGroupName": "Test App Group",
                "appGroupPermissions": ["basic_access","send_campaigns_canvases"],
                "team": [
                    {
                         "teamId": "241adcd25789fabcded",
                         "teamName": "Test Team",                  
                         "teamPermissions": ["admin"]
                    }
                ]
            } 
        ]
    }
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:x_request_origin` (String.t): 
    - `:authorization` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec scim_v2_users_youridhere_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def scim_v2_users_youridhere_get(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :"X-Request-Origin" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:get)
      |> url("/scim/v2/Users/YOUR_ID_HERE")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Update Dashboard User Account

  This endpoint allows you to update an existing dashboard user account by specifying the resource `id` returned by the SCIM [`POST`](https://www.braze.com/docs/scim/post_create_user_account/) method. It allows you to update of given and family names, permissions (for setting permissions at the company, app group, and team level) and department. For information on how to obtain a SCIM token, visit [Automated user provisioning](https://www.braze.com/docs/scim/automated_user_provisioning/).

  For security reasons, `userName` (email address) cannot be updated through this endpoint. If you would like to change the `userName` (email address) for a user, contact [Support](https://www.braze.com/docs/support_contact/).

  ## Rate limit

  This endpoint has a rate limit of 5000 requests per day, per company. This rate limit is shared with the `/scim/v2/Users/` GET, DELETE, and POST endpoints as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  

  ## Request parameters

  | Parameter | Required | Data type | Description |
  | --------- | -------- | --------- | ----------- |
  | `id` | Required | String | The user’s resource ID. This parameter is returned by the  `POST` `/scim/v2/Users/` or `GET`  `/scim/v2/Users?filter=userName eq "user@test.com"` methods. |
  | `schemas` | Required | Array of strings | Expected SCIM 2.0 schema name for user object. |
  | `name` | Required | JSON object | This object contains the user's given name and family name. |
  | `department` | Required | String | Valid department string from the [department string documentation]({{site.baseurl}}/scim_api_appendix/#department-strings). |
  | `permissions` | Required | JSON object | Permissions object as described in the [permissions object documentation]({{site.baseurl}}/scim_api_appendix/#permissions-object). |

  ## Response

  ``` json
  {
    "schemas": ["urn:ietf:params:scim:schemas:core:2.0:User"],
    "id": "dfa245b7-24195aec-887bb3ad-602b3340",
    "userName": "user@test.com",
    "name": {
        "givenName": "Test",
        "familyName": "User"
    },
    "department": "finance",
    "lastSignInAt": "Thursday, January 1, 1970 12:00:00 AM",
    "permissions": {
        "companyPermissions": ["manage_company_settings"],
        "appGroup": [
            {
                "appGroupId": "241adcd25789fabcded",
                "appGroupName": "Test App Group",
                "appGroupPermissions": ["basic_access","send_campaigns_canvases"],
                "team": [
                    {
                         "teamId": "2519dafcdba238ae7",
                         "teamName": "Test Team",                  
                         "teamPermissions": ["admin"]
                    }
                ]
            } 
        ]
    }
  }

  ```

  ### Error states

  If a user with this ID doesn’t exist in Braze, the endpoint will respond with:

  ``` json
  HTTP/1.1 404 Not Found
  Content-Type: text/html; charset=UTF-8
  {
    "schemas": ["urn:ietf:params:scim:api:messages:2.0:Error"],
    "detail": "User not found",
    "status": 404
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:x_request_origin` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec scim_v2_users_youridhere_put(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def scim_v2_users_youridhere_put(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :"X-Request-Origin" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:put)
      |> url("/scim/v2/Users/YOUR_ID_HERE")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
