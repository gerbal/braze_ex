# NOTE: This file is auto generated by OpenAPI Generator 6.1.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.ExportCampaign do
  @moduledoc """
  API calls for all endpoints tagged `ExportCampaign`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  Campaign Analytics
  This endpoint allows you to retrieve a daily series of various stats for a campaign over time. Data returned includes how many messages were sent, opened, clicked, or converted by messaging channel.  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Responses  ### Multichannel response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"data\" : [         {             \"time\" : (string) date as ISO 8601 date,             \"messages\" : {                 \"ios_push\" : [                     {                       \"variation_name\": \"iOS_Push\",                       \"sent\" : (int),                       \"direct_opens\" : (int),                       \"total_opens\" : (int),                       \"bounces\" : (int),                       \"body_clicks\" : (int)                       \"revenue\": 0,                       \"unique_recipients\": 1,                       \"conversions\": 0,                       \"conversions_by_send_time\": 0,                       \"conversions1\": 0,                       \"conversions1_by_send_time\": 0,                       \"conversions2\": 0,                       \"conversions2_by_send_time\": 0,                       \"conversions3\": 0,                       \"conversions3_by_send_time\": 0,                       \"carousel_slide_[NUM]_[TITLE]_click\": (optional, int),                       \"notif_button_[NUM]_[TITLE]_click\": (optional, int)                     }                 ],                 \"android_push\" : [                     {                       \"sent\" : (int),                       \"direct_opens\" : (int),                       \"total_opens\" : (int),                       \"bounces\" : (int),                       \"body_clicks\" : (int)                     }                 ],                 \"webhook\": [                     {                       \"sent\": (int),                       \"errors\": (int)                     }                 ],                 \"email\" : [                     {                       \"sent\": (int),                       \"opens\": (int),                       \"unique_opens\": (int),                       \"clicks\": (int),                       \"unique_clicks\": (int),                       \"unsubscribes\": (int),                       \"bounces\": (int),                       \"delivered\": (int),                       \"reported_spam\": (int)                     }                 ],                 \"sms\" : [                   {                     \"sent\": (int),                     \"delivered\": (int),                     \"undelivered\": (int),                     \"delivery_failed\": (int)                   }                 ]               },            \"conversions_by_send_time\": (optional, int),            \"conversions1_by_send_time\": (optional, int),            \"conversions2_by_send_time\": (optional, int),            \"conversions3_by_send_time\": (optional, int),            \"conversions\": (int),            \"conversions1\": (optional, int),            \"conversions2\": (optional, int),            \"conversions3\": (optional, int),            \"unique_recipients\": (int),            \"revenue\": (optional, float)         },         ...     ],     ... }  ```  ### Multivariate response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"data\" : [         {             \"time\" : (string) date as ISO 8601 date,             \"conversions\" : (int),             \"revenue\": (float),             \"conversions_by_send_time\": (int),             \"messages\" : {                \"trigger_in_app_message\": [{                       \"variation_name\": (optional, string),                       \"impressions\": (int),                       \"clicks\": (int),                       \"first_button_clicks\": (int),                       \"second_button_clicks\": (int),                       \"revenue\": (optional, float),,                       \"unique_recipients\": (int),                       \"conversions\": (optional, int),                       \"conversions_by_send_time\": (optional, int),                       \"conversions1\": (optional, int),                       \"conversions1_by_send_time\": (optional, int),                       \"conversions2\": (optional, int),                       \"conversions2_by_send_time\": (optional, int),                       \"conversions3\": (optional, int),                       \"conversions3_by_send_time\": (optional, int)                   }, {                       \"variation_name\": (optional, string),                       \"impressions\": (int),                       \"clicks\": (int),                       \"first_button_clicks\": (int),                       \"second_button_clicks\": (int),                       \"revenue\": (optional, float),,                       \"unique_recipients\": (int),                       \"conversions\": (optional, int),                       \"conversions_by_send_time\": (optional, int),                       \"conversions1\": (optional, int),                       \"conversions1_by_send_time\": (optional, int),                       \"conversions2\": (optional, int),                       \"conversions2_by_send_time\": (optional, int),                       \"conversions3\": (optional, int).                       \"conversions3_by_send_time\": (optional, int)                   }, {                       \"variation_name\": (optional, string),                       \"revenue\": (optional, float),,                       \"unique_recipients\": (int),                       \"conversions\": (optional, int),                       \"conversions_by_send_time\": (optional, int),                       \"conversions1\": (optional, int),                       \"conversions1_by_send_time\": (optional, int),                       \"conversions2\": (optional, int),                       \"conversions2_by_send_time\": (optional, int),                       \"conversions3\": (optional, int),                       \"conversions3_by_send_time\": (optional, int),                       \"enrolled\": (optional, int)                   }]               },               \"conversions_by_send_time\": (optional, int),               \"conversions1_by_send_time\": (optional, int),               \"conversions2_by_send_time\": (optional, int),               \"conversions3_by_send_time\": (optional, int),               \"conversions\": (optional, int,               \"conversions1\": (optional, int),               \"conversions2\": (optional, int),               \"conversions3\": (optional, int),               \"unique_recipients\": (int),               \"revenue\": (optional, float)          }],          ... }  ```  Possible message types are `email`, `in_app_message`, `webhook`, `android_push`, `apple_push`, `kindle_push`, `web_push`, `windows_phone8_push`, and `windows_universal_push`. All push message types will have the same statistics shown for `android_push` above.  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:campaign_id` (String.t): (Required) String  See [campaign API identifier](https://www.braze.com/docs/api/identifier_types/).  The `campaign_id` for API campaigns can be found on the **Developer Console** and the campaign details page within your dashboard, or you can use the [Campaign List Endpoint](https://www.braze.com/docs/api/endpoints/export/campaigns/get_campaign_analytics/#campaign-list-endpoint).
    - `:length` (integer()): (Required) Integer  Max number of days before `ending_at` to include in the returned series. Must be between 1 and 100 (inclusive).
    - `:ending_at` (String.t): (Optional) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Date on which the data series should end. Defaults to time of the request.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec campaigns_data_series_get(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def campaigns_data_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :campaign_id => :query,
      :length => :query,
      :ending_at => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/campaigns/data_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  Campaign Details
  This endpoint allows you to retrieve relevant information on a specified campaign, which can be identified by the `campaign_id`.  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Responses  ### Campaign details endpoint API response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"created_at\" : (string) date created as ISO 8601 date,     \"updated_at\" : (string) date last updated as ISO 8601 date,     \"archived\": (boolean) whether this Campaign is archived,     \"draft\": (boolean) whether this Campaign is a draft,     \"name\" : (string) campaign name,     \"description\" : (string) campaign description,     \"schedule_type\" : (string) type of scheduling action,     \"channels\" : (array) list of channels to send via,     \"first_sent\" : (string) date and hour of first sent as ISO 8601 date,     \"last_sent\" : (string) date and hour of last sent as ISO 8601 date,     \"tags\" : (array) tag names associated with the campaign,     \"messages\": {         \"message_variation_id\": (string) { // <=This is the actual id             \"channel\": (string) channel type of the message (as in, \"email\", \"ios_push\", \"webhook\", \"content_card\", \"in-app_message\", \"sms\"),             \"name\": (string) name of the message in the Dashboard (eg., \"Variation 1\")             ... channel-specific fields for this message, see below ...         }     },     \"conversion_behaviors\": (array) conversion event behaviors assigned to the campaign (see below) }  ```  ### Messages  The `messages` response will contain information about each message. The following includes example message responses for each channel:  #### Push channels  ``` json {     \"channel\": (string) description of the channel, such as \"ios_push\" or \"android_push\"     \"alert\": (string) alert body text,     \"extras\": (hash) any key value pairs provided }  ```  #### Email channel  ``` json {     \"channel\": \"email\",     \"subject\": (string) subject,     \"body\": (string) HTML body,     \"from\": (string) from address and display name,     \"reply_to\": (string) reply-to for message, if different than \"from\" address,     \"title\": (string) name of the email,     \"extras\": (hash) any key value pairs provided }  ```  #### In-app message channel  ``` json {     \"type\": (string) description of in-app message type, such as \"survey\",     \"data\": {         \"pages\": [             {                 \"header\":                      {                          \"text\":(string) display text for the header of the survey,                     }                 \"choices\": [                     {                        \"choice_id\": (string) choice identifier,                        \"text\": (string) display text,                         \"custom_attribute_key\": (string) custom attribute key,                         \"custom_attribute_value\": (sting) custom attribute value,                        \"deleted\": (boolean) deleted from live campaign,                      },                     ...                 ]             }         ]     } }  ```  #### Content Card channel  ``` json {     \"channel\": \"content_cards\",     \"name\": (string) name of variant,     \"extras\": (hash) any key value pairs provided; only present if at least one key-value pair has been set }  ```  #### Webhook channel  ``` json {     \"channel\": \"webhook\",     \"url\": (string) url for webhook,     \"body\": (string) payload body,     \"type\": (string) body content type,     \"headers\": (hash) specified request headers,     \"method\": (string) HTTP method (e.g., \"POST\" or \"GET\"), }  ```  #### SMS channel  ``` json {   \"channel\": \"sms\",   \"body\": (string) payload body,   \"from\": (string) list of numbers associated with the subscription group,   \"subscription_group_id\": (string) API id of the subscription group targeted in the SMS message }  ```  #### Control Messages  ``` json {     \"channel\": (string) description of the channel that the control is for,     \"type\": \"control\" }  ```  ### Conversion Behaviors  The `conversion_behaviors` array will contain information about each conversion event behavior set for the campaign. These behaviors are in order as set by the campaign. For example, Conversion Event A will be the first item in the array, Conversion Event B will be second, etc. The following lists example conversion event behavior responses:  #### Clicks email  ``` json {     \"type\": \"Clicks Email\",     \"window\": (integer) number of seconds during which the user can convert on this event, i.e. - 86400, which is 24 hours }  ```  #### Opens email  ``` json {     \"type\": \"Opens Email\",     \"window\": (integer) number of seconds during which the user can convert on this event, i.e. - 86400, which is 24 hours }  ```  #### Makes purchase (any purchase)  ``` json {     \"type\": \"Makes Any Purchase\",     \"window\": (integer) number of seconds during which the user can convert on this event, i.e. - 86400, which is 24 hours }  ```  #### Makes purchase (specific product)  ``` json {     \"type\": \"Makes Specific Purchase\",     \"window\": (integer) number of seconds during which the user can convert on this event, i.e. - 86400, which is 24 hours,     \"product\": (string) name of the product, i.e. - \"Feline Body Armor\" }  ```  #### Performs custom event  ``` json {     \"type\": \"Performs Custom Event\",     \"window\": (integer) number of seconds during which the user can convert on this event, i.e. - 86400, which is 24 hours,     \"custom_event_name\": (string) name of the event, i.e. - \"Used Feline Body Armor\" }  ```  #### Upgrades app  ``` json {     \"type\": \"Upgrades App\",     \"window\": (integer) number of seconds during which the user can convert on this event, i.e. - 86400, which is 24 hours,     \"app_ids\": (array|null) array of app ids, i.e. - [\"12345\", \"67890\"], or `null` if \"Track sessions for any app\" is selected in the UI }  ```  #### Uses app  ``` json {     \"type\": \"Starts Session\",     \"window\": (integer) number of seconds during which the user can convert on this event, i.e. - 86400, which is 24 hours,     \"app_ids\": (array|null) array of app ids, i.e. - [\"12345\", \"67890\"], or `null` if \"Track sessions for any app\" is selected in the UI }  ```  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:campaign_id` (String.t): (Required) String  See [campaign API identifier](https://www.braze.com/docs/api/identifier_types/).  The `campaign_id` for API campaigns can be found on the **Developer Console** and the campaign details page within your dashboard, or you can use the [Campaign List Endpoint](https://www.braze.com/docs/api/endpoints/export/campaigns/get_campaign_analytics/#campaign-list-endpoint).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec campaigns_details_get(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def campaigns_details_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :campaign_id => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/campaigns/details")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  Campaign List
  This endpoint allows you to export a list of campaigns, each of which will include its name, campaign API identifier, whether it is an API campaign, and tags associated with the campaign. The campaigns are returned in groups of 100 sorted by time of creation (oldest to newest by default).  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Campaign list endpoint API response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"campaigns\" : [         {             \"id\" : (string) Campaign API Identifier,             \"last_edited\": (ISO 8601 string) the last edited time for the message              \"name\" : (string) campaign name,             \"is_api_campaign\" : (boolean) whether the campaign is an API Campaign,             \"tags\" : (array) tag names associated with the campaign         },         ...     ] }  ```  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:page` (integer()): (Optional) Integer  The page of campaigns to return, defaults to 0 (returns the first set of up to 100).
    - `:include_archived` (boolean()): (Optional) Boolean  Whether or not to include archived campaigns, defaults to false.
    - `:sort_direction` (String.t): (Optional) String  - Sort creation time from newest to oldest: pass in the value `desc`. - Sort creation time from oldest to newest: pass in the value `asc`.  If `sort_direction` is not included, the default order is oldest to newest.
    - `:last_edit_periodtime_left_square_bracketgt_right_square_bracket` (String.t): (Optional) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Filters the results and only returns campaigns that were edited greater than the time provided till now. Format is `yyyy-MM-DDTHH:mm:ss`.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec campaigns_list_get(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def campaigns_list_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :page => :query,
      :include_archived => :query,
      :sort_direction => :query,
      :"last_edit.time[gt]" => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/campaigns/list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  Send Analytics
  This endpoint allows you to retrieve a daily series of various stats for a tracked `send_id`. Braze stores send analytics for 14 days after the send.  Campaign conversions will be attributed towards the most recent send id that a given user has received from the campaign.  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Response  ### Send analytics endpoint API response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {             \"variation_name\": (string) variation name,             \"sent\": (int) the number of sends,             \"delivered\": (int) the number of messages successfully delivered,             \"undelivered\": (int) the number of undelivered,             \"delivery_failed\": (int) the number of rejected,             \"direct_opens\": (int) the number of direct opens,             \"total_opens\": (int) the number of total opens,             \"bounces\": (int) the number of bounces,             \"body_clicks\": (int) the number of body clicks,             \"revenue\": (float) the number of dollars of revenue (USD),             \"unique_recipients\": (int) the number of unique recipients,             \"conversions\": (int) the number of conversions,             \"conversions_by_send_time\": (int) the number of conversions,             \"conversions1\": (int, optional) the number of conversions for the second conversion event,             \"conversions1_by_send_time\": (int, optional) the number of conversions for the second conversion event by send time,             \"conversions2\": (int, optional) the number of conversions for the third conversion event,             \"conversions2_by_send_time\": (int, optional) the number of conversions for the third conversion event by send time,             \"conversions3\": (int, optional) the number of conversions for the fourth conversion event,             \"conversions3_by_send_time\": (int, optional) the number of conversions for the fourth conversion event by send time           }         ]       },       \"conversions_by_send_time\": 0,       \"conversions1_by_send_time\": 0,       \"conversions2_by_send_time\": 0,       \"conversions3_by_send_time\": 0,       \"conversions\": 0,       \"conversions1\": 0,       \"conversions2\": 0,       \"conversions3\": 0,       \"unique_recipients\": 1,       \"revenue\": 0     }   ],   \"message\": \"success\" }  ```  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:campaign_id` (String.t): (Required) String  See [Campaign API identifier](https://www.braze.com/docs/api/identifier_types/).
    - `:send_id` (String.t): (Required) String  See [Send API identifier](https://www.braze.com/docs/api/identifier_types/).
    - `:length` (integer()): (Required) Integer  Max number of days before `ending_at` to include in the returned series. Must be between 1 and 100 (inclusive).
    - `:ending_at` (String.t): (Optional) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Date on which the data series should end. Defaults to time of the request.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec sends_data_series_get(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def sends_data_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :campaign_id => :query,
      :send_id => :query,
      :length => :query,
      :ending_at => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/sends/data_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end
end
