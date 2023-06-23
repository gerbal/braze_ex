# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.SubscriptionGroupsSMS do
  @moduledoc """
  API calls for all endpoints tagged `SubscriptionGroupsSMS`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## List User's  Subscription Group Status - SMS

  > Use this endpoint to get the subscription state of a user in a subscription group. 


  To use this endpoint, you’ll need to generate an API key with the `subscription.status.get` permission.

  These groups will be available on the **Subscription Group** page. The response from this endpoint will include the external ID and either subscribed, unsubscribed, or unknown for the specific subscription group requested in the API call. This can be used to update the subscription group state in subsequent API calls or to be displayed on a hosted web page.

  \*Either `external_id` or `phone` are required. When both are submitted, only the external_id is used for querying and the phone number is applied to that user.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  All successful responses will return `subscribed`, `unsubscribed`, or `unknown` depending on status and user history with the subscription group.

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "status": {
    "1": "Unsubscribed",
    "2": "Subscribed"
  },
  "message": "success"
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:subscription_group_id` (String.t): (Required) String  The `id` of your subscription group.
    - `:external_id` (String.t): (Required*) String  The `external_id` of the user (must include at least one and at most 50 `external_ids`).  When both an `external_id` and `phone` are submitted, only the external_id(s) provided will be applied to the result query. 
    - `:phone` (float()): (Required*) String in [E.164](https://en.wikipedia.org/wiki/E.164) format  The phone number of the user (must include at least one phone number and at most 50 phone numbers).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec subscription_status_get_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def subscription_status_get_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :subscription_group_id => :query,
      :external_id => :query,
      :phone => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/subscription/status/get")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Update User's Subscription Group Status - SMS

  > Use this endpoint to batch update the subscription state of up to 50 users on the Braze dashboard. 


  To use this endpoint, you’ll need to generate an API key with the `subscription.status.set` permission.

  You can access a subscription group’s `subscription_group_id` by navigating to the **Subscription Group** page.

  Tip: When creating new users via the [/users/track](https://www.braze.com/docs/api/endpoints/user_data/post_user_track/) endpoint, you can set subscription groups within the user attributes object, which allows you to create a user and set the subscription group state in one API call.

  \*Only `external_id` or `phone` is accepted for SMS subscription groups.

  ### Rate limit

  For customers who onboarded with Braze on or after January 6, 2022, we apply a rate limit of 5,000 requests per minute shared across the `/subscription/status/set` and `/v2/subscription/status/set` endpoint as documented in [API rate limits](http://localhost:4000/docs/api/api_limits/).

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `subscription_group_id` | Required | String | The `id` of your subscription group. |
  | `subscription_state` | Required | String | Available values are `unsubscribed` (not in subscription group) or `subscribed` (in subscription group). |
  | `external_id` | Required\* | Array of strings | The `external_id` of the user or users, may include up to 50 `id`s. |
  | `phone` | Required\* | String in [E.164](https://en.wikipedia.org/wiki/E.164) format | The phone number of the user, can be passed as an array of strings. Must include at least one phone number (with a max of 50). |

  ### Example successful response

  The status code `201` could return the following response body.

  ``` json
  {
    "message": "success"
  }

  ```

  Important: The endpoint only accepts the `email` or `phone` value, not both. If given both, you will receive this response: `{"message":"Either an email address or a phone number should be provided, but not both."}`

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
  @spec subscription_status_set_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def subscription_status_set_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/subscription/status/set")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## List User's Subscription Group - SMS

  > Use this endpoint to list and get the subscription groups of a certain user. 


  To use this endpoint, you’ll need to generate an API key with the `subscription.groups.get` permission.

  If there are multiple users (multiple external IDs) who share the same email address, all users will be returned as a separate user (even if they have the same email address or subscription group).

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:external_id` (String.t): (Required*) String  The `external_id` of the user (must include at least one and at most 50 `external_ids`).
    - `:limit` (integer()): (Optional) Integer  The limit on the maximum number of results returned. Default (and max) limit is 100.
    - `:offset` (integer()): (Optional) Integer   Number of templates to skip before returning the rest of the templates that fit the search criteria.
    - `:phone` (float()): (Required*) String in [E.164](https://en.wikipedia.org/wiki/E.164) format  The phone number of the user. Must include at least one phone number (with a max of 50).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec subscription_user_status_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def subscription_user_status_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :external_id => :query,
      :limit => :query,
      :offset => :query,
      :phone => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/subscription/user/status")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Update User's Subscription Group Status V2

  > Use this endpoint to batch update the subscription state of up to 50 users on the Braze dashboard. 


  To use this endpoint, you’ll need to generate an API key with the `subscription.status.set` permission.

  You can access a subscription group’s `subscription_group_id` by navigating to the **Subscriptions Group** page.

  ## Rate limit

  For customers who onboarded with Braze on or after January 6, 2022, we apply a rate limit of 5,000 requests per minute shared across the `/subscription/status/set` and `/v2/subscription/status/set` endpoint as documented in [API rate limits](http://localhost:4000/docs/api/api_limits/).

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `subscription_group_id` | Required | String | The `id` of your subscription group. |
  | `subscription_state` | Required | String | Available values are `unsubscribed` (not in subscription group) or `subscribed` (in subscription group). |
  | `external_ids` | Required\* | Array of strings | The `external_id` of the user or users, may include up to 50 `id`s. |
  | `phones` | Required\* | String in [E.164](https://en.wikipedia.org/wiki/E.164) format | The phone numbers of the user, can be passed as an array of strings. Must include at least one phone number (with a max of 50). |

  ### Example successful response

  Response: (status 201)

  ``` json
  {
    "message": "success"
  }

  ```

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
  @spec v2_subscription_status_set_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def v2_subscription_status_set_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/v2/subscription/status/set")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
