# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.MessagingSendMessages do
  @moduledoc """
  API calls for all endpoints tagged `MessagingSendMessages`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  ## Send Campaign Messages via API Triggered Delivery

  > Use this endpoint to send immediate, ad-hoc messages to designated users via API-triggered delivery. 


  To use this endpoint, you’ll need to generate an API key with the `campaigns.trigger.send` permission.

  API-triggered delivery allows you to house message content inside of the Braze dashboard while dictating when a message is sent, and to whom via your API.

  If you are targeting a segment, a record of your request will be stored in the [Developer Console](https://dashboard.braze.com/app_settings/developer_console/activitylog/). Note that to send messages with this endpoint, you must have a [campaign ID](https://www.braze.com/docs/api/identifier_types/) created when you build an [API-triggered campaign](https://www.braze.com/docs/api/api_campaigns/).

  ## Rate limit

  When specifying a segment or Connected Audience in your request, we apply a rate limit of 250 requests per minute to this endpoint. Otherwise, if specifying an `external_id`, this endpoint has a default rate limit of 250,000 requests per hour, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  Braze endpoints support [batching API requests](https://www.braze.com/docs/api/api_limits/#batching-api-requests). A single request to the messaging endpoints can reach any of the following:

  - Up to 50 specific `external_ids`, each with individual message parameters
  - A segment of any size created in the Braze dashboard, specified by its `segment_id`
  - An ad-hoc audience segment of any size, defined in the request as a [Connected Audience](https://www.braze.com/docs/api/objects_filters/connected_audience/) object
    

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `campaign_id` | Required | String | See [campaign identifier](https://www.braze.com/docs/api/identifier_types/). |
  | `send_id` | Optional | String | See [send identifier](https://www.braze.com/docs/api/identifier_types/). |
  | `trigger_properties` | Optional | Object | See [trigger properties](https://www.braze.com/docs/api/objects_filters/trigger_properties_object/). Personalization key-value pairs that will apply to all users in this request. |
  | `broadcast` | Optional | Boolean | See [broadcast](https://www.braze.com/docs/api/parameters/#broadcast). This parameter defaults to false (as of August 31, 2017).  <br>  <br>If `recipients` is omitted, `broadcast` must be set to true. However, use caution when setting `broadcast: true`, as unintentionally setting this flag may cause you to send your campaign to a larger than expected audience. |
  | `audience` | Optional | Connected audience object | See [connected audience](https://www.braze.com/docs/api/objects_filters/connected_audience/). |
  | `recipients` | Optional | Array | See [recipients object](https://www.braze.com/docs/api/objects_filters/recipient_object/). If not provided and `broadcast` is set to true, the message will send to the entire segment targeted by the campaign. |

  The recipients array may contain up to 50 objects, with each object containing a single `external_user_id` string and `trigger_properties` object.

  When `send_to_existing_only` is `true`, Braze will only send the message to existing users. When `send_to_existing_only` is `false` and a user with the given `id` does not exist, Braze will create a user with that id and attributes before sending the message.

  > Important: A user’s subscription group status can be updated via the inclusion of a subscription_groups parameter within the attributes object. This is currently in early access. Contact your Braze customer success manager if you’re interested in participating in the early access. More details can be found in the [User attributes object](https://www.braze.com/docs/api/objects_filters/user_attributes_object). 


  ## Response details

  Message sending endpoint responses will include the message’s `dispatch_id` for reference back to the dispatch of the message. The `dispatch_id` is the ID of the message dispatch, a unique ID for each transmission sent from the Braze platform. When using this endpoint, you receive a single `dispatch_id` for an entire batched set of users. For more information on `dispatch_id` check out out our documentation on [Dispatch ID Behavior](https://www.braze.com/docs/help/help_articles/data/dispatch_id/).

  ## Create send endpoint

  **Using the attributes object in campaigns**

  Braze has a Messaging Object called `Attributes` that will allow you to add, create, or update attributes and values for a user before you send them an API-triggered campaigns using the `campaign/trigger/send` endpoint as this API call will process the User Attributes object before it processes and sends the campaign. This helps minimize the risk of there being issues caused by [race conditions](https://www.braze.com/docs/help/best_practices/race_conditions/).

  > **Important:** Looking for the Canvas version of this endpoint? Check out [Sending Canvas messages via API-triggered delivery](https://www.braze.com/docs/api/endpoints/messaging/send_messages/post_send_triggered_canvases/#create-send-endpoint).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec campaigns_trigger_send_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def campaigns_trigger_send_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/campaigns/trigger/send")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Send Canvas Messages via API Triggered Delivery

  > Use this endpoint to send Canvas messages via API-triggered delivery. 


  To use this endpoint, you’ll need to generate an API key with the `canvas.trigger.send` permission.

  API-triggered delivery allows you to house message content inside of the Braze dashboard while dictating when a message is sent, and to whom via your API.

  Note that to send messages with this endpoint, you must have a [Canvas ID](https://www.braze.com/docs/api/identifier_types/#canvas-api-identifier) created when you build a Canvas.

  ## Rate limit

  When specifying a segment or Connected Audience in your request, we apply a rate limit of 250 requests per minute to this endpoint. Otherwise, if specifying an `external_id`, this endpoint has a default rate limit of 250,000 requests per hour, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  Braze endpoints support [batching API requests](https://www.braze.com/docs/api/api_limits/#batching-api-requests). A single request to the messaging endpoints can reach any of the following:

  - Up to 50 specific `external_ids`, each with individual message parameters
  - A segment of any size created in the Braze dashboard, specified by its `segment_id`
  - An ad-hoc audience segment of any size, defined in the request as a [Connected Audience](https://www.braze.com/docs/api/objects_filters/connected_audience/) object
    

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `canvas_id` | Required | String | See [Canvas identifier](https://www.braze.com/docs/api/identifier_types/). |
  | `canvas_entry_properties` | Optional | Object | See [Canvas entry properties](https://www.braze.com/docs/api/objects_filters/canvas_entry_properties_object/). Personalization key-value pairs that will apply to all users in this request. The Canvas entry properties object has a maximum size limit of 50 KB. |
  | `broadcast` | Optional | Boolean | You must set `broadcast` to true when sending a message to an entire segment that a campaign or Canvas targets. This parameter defaults to false (as of August 31, 2017).  <br>  <br>If `broadcast` is set to true, a recipients list cannot be included. However, use caution when setting `broadcast: true`, as unintentionally setting this flag may cause you to send your message to a larger than expected audience. |
  | `audience` | Optional | Connected audience object | See [Connected audience](https://braze.com/docs/api/objects_filters/connected_audience/). |
  | `recipients` | Optional | Array | See [Recipients object](https://www.braze.com/docs/api/objects_filters/recipient_object/). If not provided and `broadcast` is set to true, the message will send to the entire segment targeted by the Canvas.  <br>  <br>The `recipients` array may contain up to 50 objects, with each object containing a single `external_user_id` string and `canvas_entry_properties` object. Either `external_user_id` or user_alias is required for this call. Requests must specify only one.  <br>  <br>When `send_to_existing_only` is true, Braze will only send the message to existing users—however this flag can’t be used with user aliases. When `send_to_existing_only` is `false` and a user with the given `id` does not exist, Braze will create a user with that ID and attributes before sending the message. |

  Customers using the API for server-to-server calls may need to whitelist the appropriate API URL if they’re behind a firewall.

  > **Note:** If you include both specific users in your API call and a target segment in the dashboard, the message will send to specifically the user profiles that are in the API call and qualify for the segment filters. 


  ## Response details

  Message sending endpoint responses will include the message’s `dispatch_id` for reference back to the dispatch of the message. The `dispatch_id` is the ID of the message dispatch (unique ID for each “transmission” sent from the Braze platform). Check out [Dispatch ID behavior](https://www.braze.com/docs/help/help_articles/data/dispatch_id/) for more information.

  ## Create send endpoint

  **Using the Attributes Object in Canvas**

  Braze has a Messaging Object called `Attributes` that allows you to add, create, or update attributes and values for a user before sending them an API-Triggered Canvas using the `canvas/trigger/send` endpoint as this API call will process the User Attributes object before it processes and sends the Canvas. This helps minimize the risk of there being issues caused by [race conditions](https://www.braze.com/docs/help/best_practices/race_conditions/).

  > **Important:** Looking for the camaigns version of this endpoint? Check out [Sending campaign messages via API-triggered delivery](https://www.braze.com/docs/api/endpoints/messaging/send_messages/post_send_triggered_campaigns/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec canvas_trigger_send_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_trigger_send_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/canvas/trigger/send")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Send Messages Immediately via API Only

  > Use this endpoint to send immediate, ad-hoc messages to designated users via the Braze API. 


  To use this endpoint, you’ll need to generate an API key with the `messages.send` permission.

  Be sure to include Messaging Objects in your body to complete your requests.

  If you are targeting a segment, a record of your request will be stored in the [Developer Console](https://dashboard.braze.com/app_settings/developer_console/activitylog/).

  ## Rate limit

  When specifying a segment or Connected Audience in your request, we apply a rate limit of 250 requests per minute to this endpoint. Otherwise, if specifying an `external_id`, this endpoint has a default rate limit of 250,000 requests per hour, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  Braze endpoints support [batching API requests](https://www.braze.com/docs/api/api_limits/#batching-api-requests). A single request to the messaging endpoints can reach any of the following:

  - Up to 50 specific `external_ids`, each with individual message parameters
  - A segment of any size created in the Braze dashboard, specified by its `segment_id`
  - An ad-hoc audience segment of any size, defined in the request as a [Connected Audience](https://www.braze.com/docs/api/objects_filters/connected_audience/) object
    

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `broadcast` | Optional | Boolean | See [broadcast](https://www.braze.com/docs/api/parameters/#broadcast). This parameter defaults to false (as of August 31, 2017).  <br>  <br>If `recipients` is omitted, `broadcast` must be set to true. However, use caution when setting `broadcast: true`, as unintentionally setting this flag may cause you to send your messages to a larger than expected audience. |
  | `external_user_ids` | Optional | Array of strings | See [external user ID](https://www.braze.com/docs/api/parameters/#external-user-id). |
  | `user_aliases` | Optional | Array of user alias objects | See [user alias object](https://www.braze.com/docs/api/objects_filters/user_alias_object/). |
  | `segment_id` | Optional | String | See [segment identifier](https://www.braze.com/docs/api/identifier_types/). |
  | `audience` | Optional | Connected audience object | See [connected audience](https://www.braze.com/docs/api/objects_filters/connected_audience/). |
  | `campaign_id` | Optional\* | String | See [campaign identifier](https://www.braze.com/docs/api/identifier_types/) for more information.  <br>  <br>\*Required if you wish to track campaign stats (e.g. sends, clicks, bounces, etc) on the Braze dashboard. |
  | `send_id` | Optional | String | See [send identifier](https://www.braze.com/docs/api/identifier_types/) |
  | `override_frequency_capping` | Optional | Boolean | Ignore \`frequency_capping\` for campaigns, defaults to false. |
  | `recipient_subscription_state` | Optional | String | Use this to send messages to only users who have opted in (`opted_in`), only users who have subscribed or are opted in (`subscribed`) or to all users, including unsubscribed users (`all`).  <br>  <br>Using `all` users is useful for transactional email messaging. Defaults to `subscribed`. |
  | `messages` | Optional | Messaging objects | See available [messaging objects](https://www.braze.com/docs/api/endpoints/messaging/send_messages/post_send_messages/#available-messaging-objects). |

  ## Response details

  Message sending endpoint responses will include the message’s `dispatch_id` for reference back to the dispatch of the message. The `dispatch_id` is the id of the message dispatch (unique id for each ‘transmission’ sent from the Braze platform). For more, information refer to [Dispatch ID behavior](https://www.braze.com/docs/help/help_articles/data/dispatch_id/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec messages_send_post(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def messages_send_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/messages/send")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Create Send IDs For Message Send Tracking

  > Use this endpoint to create send IDs that can be used to send messages and track message performance programatically, without campaign creation for each send. 


  To use this endpoint, you’ll need to generate an API key with the `sends.id.create` permission.

  Using the send identifier to track and send messages is useful if you are planning to programmatically generate and send content.

  ## Rate limit

  The daily maximum number of custom send identifiers that can be created via this endpoint is 100 for a given app group. Each `send_id` and `campaign_id` combination that you create will count towards your daily limit. The response headers for any valid request include the current rate limit status, see [API rate limits](https://www.braze.com/docs/api/api_limits/) for details.

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `campaign_id` | Required | String | See [campaign identifier]({{site.baseurl}}/api/identifier_types/). |
  | `send_id` | Optional | String | See [send identifier]({{site.baseurl}}/api/identifier_types/). |

  ## Response

  ### Example success response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "message": "success",
  "send_id" : (string) the send identifier
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec sends_id_create_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def sends_id_create_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/sends/id/create")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Send Transactional Email via API Triggered Delivery

  > Use this endpoint to send immediate, ad-hoc transactional messages to a designated user. 


  To use this endpoint, you’ll need to generate an API key with the `transactional.send` permission.

  This endpoint is used alongside the creation of a [Transactional Email campaign](https://www.braze.com/docs/api/api_campaigns/transactional_campaigns) and corresponding campaign ID.

  > **Important:** Transactional Email is currently available as part of select Braze packages. Reach out to your Braze customer success manager for more details. 


  Similar to the [Send triggered campaign endpoint](https://www.braze.com/docs/api/endpoints/messaging/send_messages/post_send_triggered_campaigns/), this campaign type allows you to house message content inside of the Braze dashboard while dictating when and to whom a message is sent via your API. Unlike the Send triggered campaign endpoint, which accepts an audience or segment to send messages to, a request to this endpoint must specify a single user either by `external_user_id` or `user_alias`, as this campaign type is purpose-built for 1:1 messaging of alerts like order confirmations or password resets.

  ## Rate limit

  Transactional Emails are not subject to a rate limit. Depending on your chosen package, a set number of Transactional Emails is covered per hour by SLA. Requests that exceed that rate will still send, but are not covered by SLA. 99.9% of emails will send in less than one minute.

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `campaign_id` | Required | String | ID of the campaign |

  ## Request Parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `external_send_id` | Optional | String | A Base64 compatible string. Validated against the following regex `/^[a-zA-Z0-9-_+\/=]+$/`. This optional field allows you to pass an internal identifier for this particular send which will be included in events sent from the Transactional HTTP event postback. When passed, this identifier will also be used as a deduplication key, which Braze will store for 24 hours. Passing the same identifier in another request will not result in a new instance of a send by Braze for 24 hours. |
  | `trigger_properties` | Optional | Object | See [trigger properties](https://www.braze.com/docs/api/objects_filters/trigger_properties_object/). Personalization key-value pairs that will apply to the user in this request. |
  | `recipients` | Required | Object | The user you are targeting this message to. Can contain `attributes` and a single `external_user_id` or `user_alias`.  <br>  <br>Note that if you provide an external user ID that doesn’t already exist in Braze, passing any fields to the `attributes` object will create this user profile in Braze and send this message to the newly created user.  <br>  <br>If you send multiple requests to the same user with different data in the `attributes` object, Braze will ensure that `first_name`, `last_name`, and `email` attributes will be updated synchronously and templated into your message. Custom attributes don’t have this same protection, so proceed with caution when updating a user through this API and passing different custom attribute values in quick succession. |

  ## Response

  The send transactional email endpoint will respond with the message’s `dispatch_id` which represents the instance of this message send. This identifier can be used along with events from the Transactional HTTP event postback to trace the status of an individual email sent to a single user.

  ### Example response

  ``` json
  {
    "dispatch_id": Out-of-the-box generated Unique ID of the instance of this send
    "status": Current status of the message
    "metadata": Object containing additional information about the send instance
  }

  ```

  ## Troubleshooting

  The endpoint may also return an error code and a human-readable message in some cases, most of which are validation errors. Here are some common errors you may get when making invalid requests.

  | Error | Troubleshooting |
  | --- | --- |
  | `The campaign is not a transactional campaign. Only transactional campaigns may use this endpoint` | The campaign ID provided is not for a transactional campaign. |
  | `The external reference has been queued. Please retry to obtain send_id.` | The external_send_id has been created recently, try a new external_send_id if you are intending to send a new message. |
  | `Campaign does not exist` | The campaign ID provided does not correspond to an existing campaign. |
  | `The campaign is archived. Unarchive the campaign to ensure trigger requests will take effect.` | The campaign ID provided corresponds to an archived campaign. |
  | `The campaign is paused. Resume the campaign to ensure trigger requests will take effect.` | The campaign ID provided corresponds to a paused campaign. |
  | `campaign_id must be a string of the campaign api identifier` | The campaign ID provided is not a valid format. |
  | `Error authenticating credentials` | The API key provided is invalid |
  | `Invalid whitelisted IPs` | The IP address sending the request is not on the IP whitelist (if it is being utilized) |
  | `You do not have permission to access this resource` | The API key used does not have permission to take this action |

  Most endpoints at Braze have a rate limit implementation that will return a 429 response code if you have made too many requests. The transactional sending endpoint works differently -- if you exceed your allotted rate limit, our system will continue to ingest the API calls, return success codes, and send the messages, however those messages may not be subject to the contractual SLA for the feature. Please reach out if you need more information about this functionality.

  ## Transactional HTTP Event Postback

  All transactional emails are complemented with event status postbacks sent as an HTTP request back to your specified URL. This will allow you to evaluate the message status in real-time and take action to reach the user on another channel if the message goes undelivered, or fallback to an internal system if Braze is experiencing latency.

  In order to associate the incoming events to a particular instance of send, you can choose to either capture and store the Braze `dispatch_id` returned in the [API response](https://www.braze.com/docs/api/endpoints/messaging/send_messages/post_send_transactional_message/#example-response), or pass your own identifier to the `external_send_id` field. An example of a value you may choose to pass to that field may be an order ID, where after completing order 1234, an order confirmation message is triggered to the user through Braze, and `external_send_id : 1234` is included in the request. All following event postbacks such as `Sent` and `Delivered` will include `external_send_id : 1234` in the payload allowing you to confirm that user successfully received their order confirmation email.

  To get started using the Transactional HTTP Event Postback, navigate to **Settings** > **Workspace Settings** > **Email Preferences**. in your Braze dashboard and input your desired URL to receive postbacks.

  Note: If you are using our [older navigation](https://www.braze.com/docs/navigation), **Email Preferences** can be found at ****Manage Settings** > **Email Settings****.

  ### Postback body

  ``` json
  // Sent Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "sent",
    "metadata": {
      "received_at": "2020-08-31T18:58:41.000+00:00",
      "enqueued_at": "2020-08-31T18:58:41.000+00:00",
      "executed_at": "2020-08-31T18:58:41.000+00:00",
      "sent_at": "2020-08-31T18:58:42.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Processed Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "processed",
    "metadata": {
      "processed_at": "2020-08-31T18:58:42.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Aborted
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "aborted",
    "metadata": {
      "reason": "User not emailable",
      "aborted_at": "2020-08-31T19:04:51.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Delivered Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "delivered",
    "metadata": {
      "delivered_at": "2020-08-31T18:27:32.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Bounced Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "bounced",
    "metadata": {
      "bounced_at": "2020-08-31T18:58:43.000+00:00",
      "reason": "550 5.1.1 The email account that you tried to reach does not exist",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }

  ```

  #### Message status

  | **Status** | **Description** |
  | --- | --- |
  | `sent` | Message successfully dispatched to Braze’s email sending partner |
  | `processed` | Email sending partner has successfully received and prepared the message for sending to the user’s inbox provider |
  | `aborted` | Braze was unable to successfully dispatch the message due to the user not having an emailable address, or Liquid abort logic was called in the message body. All aborted events include a reason field within the metadata object indicating why the message was aborted |
  | `delivered` | Message was accepted by the user’s email inbox provider |
  | `bounced` | Message was rejected by the user’s email inbox provider. All bounced events include a reason field within the metadata object reflecting the bounce error code provided by the inbox provider |

  ### Example postback

  ``` json
  // Sent Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "sent",
    "metadata": {
      "received_at": "2020-08-31T18:58:41.000+00:00",
      "enqueued_at": "2020-08-31T18:58:41.000+00:00",
      "executed_at": "2020-08-31T18:58:41.000+00:00",
      "sent_at": "2020-08-31T18:58:42.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Processed Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "processed",
    "metadata": {
      "processed_at": "2020-08-31T18:58:42.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Aborted
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "aborted",
    "metadata": {
      "reason": "User not emailable",
      "aborted_at": "2020-08-31T19:04:51.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Delivered Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "delivered",
    "metadata": {
      "delivered_at": "2020-08-31T18:27:32.000+00:00",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }
  // Bounced Event
  {
    "dispatch_id": "acf471119f7449d579e8089032003ded",
    "status": "bounced",
    "metadata": {
      "bounced_at": "2020-08-31T18:58:43.000+00:00",
      "reason": "550 5.1.1 The email account that you tried to reach does not exist",
      "campaign_api_id": "417220e4-5a2a-b634-7f7d-9ec891532368",
      "external_send_id" : "34a2ceb3cf6184132f3d816e9984269a"
    }
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `campaign_id` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec transactional_v1_campaigns_campaign_id_send_post(
          Tesla.Env.client(),
          String.t(),
          keyword()
        ) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def transactional_v1_campaigns_campaign_id_send_post(connection, campaign_id, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/transactional/v1/campaigns/#{campaign_id}/send")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end
end
