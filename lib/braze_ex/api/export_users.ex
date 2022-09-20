# NOTE: This file is auto generated by OpenAPI Generator 6.1.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.ExportUsers do
  @moduledoc """
  API calls for all endpoints tagged `ExportUsers`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  User Profile Export by Global Control Group
  This endpoint allows you to export all the users within the Global Control Group. User data is exported as multiple files of user JSON objects separated by new lines (i.e., one JSON object per line).  > Warning: Individual custom attributes cannot be exported. However, all custom attributes can be exported by including custom_attributes in the fields_to_export array (e.g.,\\[‘first_name’, ‘email’, ‘custom_attributes’\\]).  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](http://localhost:4000/docs/api/api_limits/).  ## Credential-based response details  For information regarding credentials-based response details, visit this [section](https://www.braze.com/docs/api/endpoints/export/user_data/post_users_global_control_group/#credentials-based-response-details) in the Braze API docs.  ## Request parameters  | Parameter | Required | Data Type | Description | | --- | --- | --- | --- | | `callback_endpoint` | Optional | String | Endpoint to post a download URL to when the export is available. | | `fields_to_export` | Required* | Array of strings | Name of user data fields to export, you may also export custom attributes.  <br>  <br>*Beginning April 2021, new accounts must specify specific fields to export. | | `output_format` | Optional | String | When using your own S3 bucket, allows to specify file format as `zip` or `gzip`. Defaults to ZIP file format. |  ## Fields to export  The following is a list of valid fields_to_export. Using fields_to_export to minimize the data returned can improve response time of this API endpoint:  *   `apps` *   `attributed_campaign` *   `attributed_source` *   `attributed_adgroup` *   `attributed_ad` *   `braze_id` *   `country` *   `created_at` *   `custom_attributes` *   `custom_events` *   `devices` *   `dob` *   `email` *   `external_id` *   `first_name` *   `gender` *   `home_city` *   `language` *   `last_coordinates` *   `last_name` *   `phone` *   `purchases` *   `random_bucket` *   `time_zone` *   `total_revenue` *   `uninstalled_at` *   `user_aliases`       ## Response  ``` Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"object_prefix\": (required, string) the filename prefix that will be used for the JSON file produced by this export, e.g.,'bb8e2a91-c4aa-478b-b3f2-a4ee91731ad1-1464728599',     \"url\" : (optional, string) the URL where the segment export data can be downloaded if you do not have your own S3 credentials }  ```  Once made available, the URL will only be valid for a few hours. As such, we highly recommend that you add your own S3 credentials to Braze.  ### Sample user export file output  User export object (we will include the least data possible - if a field is missing from the object it should be assumed to be null, false, or empty):  ``` {     \"external_id\" : (string),     \"user_aliases\" : [       {         \"alias_name\" : (string),         \"alias_label\" : (string)       }     ],     \"braze_id\": (string),     \"first_name\" : (string),     \"last_name\" : (string),     \"email\" : (string),     \"dob\" : (string) date for the user's date of birth,     \"home_city\" : (string),     \"country\" : (string),     \"phone\" : (string),     \"language\" : (string) ISO-639 two letter code,     \"time_zone\" : (string),     \"last_coordinates\" : (array of float) [lon, lat],     \"gender\" : (string) \"M\" | \"F\",     \"total_revenue\" : (float),     \"attributed_campaign\" : (string),     \"attributed_source\" : (string),     \"attributed_adgroup\" : (string),     \"attributed_ad\" : (string),     \"custom_attributes\" : (object) custom attribute key-value pairs,     \"custom_events\" : [         {             \"name\" : (string),             \"first\" : (string) date,             \"last\" : (string) date,             \"count\" : (int)         },         ...     ],     \"purchases\" : [         {             \"name\" : (string),             \"first\" : (string) date,             \"last\" : (string) date,             \"count\" : (int)         },         ...     ],     \"devices\" : [         {             \"model\" : (string),             \"os\" : (string),             \"carrier\" : (string),             \"idfv\" : (string) only included for iOS devices,             \"idfa\" : (string) only included for iOS devices when IDFA collection is enabled,             \"google_ad_id\" : (string) only included for Android devices when Google Play Advertising Identifier collection is enabled,             \"roku_ad_id\" : (string) only included for Roku devices,             \"windows_ad_id\" : (string) only included for Windows devices,             \"ad_tracking_enabled\" : (bool)         },         ...     ],     \"apps\" : [         {             \"name\" : (string),             \"platform\" : (string),             \"version\" : (string),             \"sessions\" : (string),             \"first_used\" : (string) date,             \"last_used\" : (string) date         },         ...     ], }  ```

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
  @spec users_export_global_control_group_post(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def users_export_global_control_group_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/users/export/global_control_group")
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
  User Profile Export by Identifier
  This endpoint allows you to export data from any user profile by specifying a form of user identifier. Up to 50 `external_ids` or `user_aliases` can be included in a single request. Should you want to specify `device_id` or `email_address` only one of either identifier can be included per request.  ## Rate limit  For customers who onboarded with Braze on or after August 16, 2021, we apply a rate limit of 2,500 requests per minute to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Request parameters  | Parameter | Required | Data Type | Description | | --- | --- | --- | --- | | `external_ids` | Optional | Array of strings | External identifiers for users you wish export. | | `user_aliases` | Optional | Array of user alias object | [User aliases](https://www.braze.com/docs/api/objects_filters/user_alias_object/) for users to export. | | `device_id` | Optional | String | Device identifier, as returned by various SDK methods such as `getDeviceId`. | | `braze_id` | Optional | String | Braze identifier for a particular user. | | `email_address` | Optional | String | Email address of user. | | `phone` | Optional | String in [E.164](https://en.wikipedia.org/wiki/E.164) format | Phone number of user. | | `fields_to_export` | Optional | Array of strings | Name of user data fields to export. Defaults to all if not provided. |  ### Fields to export  The following is a list of valid `fields_to_export`. Using `fields_to_export` to minimize the data returned can improve response time of this API endpoint:  *   `apps` *   `attributed_campaign` *   `attributed_source` *   `attributed_adgroup` *   `attributed_ad` *   `braze_id` *   `campaigns_received` *   `canvases_received` *   `cards_clicked` *   `country` *   `created_at` *   `custom_attributes` *   `custom_events` *   `devices` *   `dob` *   `email` *   `email_subscribe` *   `external_id` *   `first_name` *   `gender` *   `home_city` *   `language` *   `last_coordinates` *   `last_name` *   `phone` *   `purchases` *   `push_subscribe` *   `push_tokens` *   `random_bucket` *   `time_zone` *   `total_revenue` *   `uninstalled_at` *   `user_aliases`       Be aware that the `/users/export/ids` endpoint will pull together the entire user profile for this user, including data such as all campaigns and Canvases received, all custom events performed, all purchases made, and all custom attributes. As a result, this endpoint is slower than other REST API endpoints.  Depending on the data requested, this API endpoint may not be sufficient to meet your needs due to the 2,500 requests per minute rate limit. If you anticipate using this endpoint regularly to export users, instead consider exporting users by segment, which is asynchronous and more optimized for larger data pulls.  ### Response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"users\" : (array of object) the data for each of the exported users, may be empty if no users are found,     \"invalid_user_ids\" : (optional, array of string) each of the identifiers provided in the request that did not correspond to a known user }  ```  For an example of the data that is accessible via this endpoint see the following example.  ### Sample user export file output  User export object (we will include the least data possible - if a field is missing from the object it should be assumed to be null, false, or empty):  ``` json {     \"external_id\" : (string),     \"user_aliases\" : [       {         \"alias_name\" : (string),         \"alias_label\" : (string)       }     ],     \"braze_id\": (string),     \"first_name\" : (string),     \"last_name\" : (string),     \"email\" : (string),     \"dob\" : (string) date for the user's date of birth,     \"home_city\" : (string),     \"country\" : (string),     \"phone\" : (string),     \"language\" : (string) ISO-639 two letter code,     \"time_zone\" : (string),     \"last_coordinates\" : (array of float) [lon, lat],     \"gender\" : (string) \"M\" | \"F\",     \"total_revenue\" : (float),     \"attributed_campaign\" : (string),     \"attributed_source\" : (string),     \"attributed_adgroup\" : (string),     \"attributed_ad\" : (string),     \"push_subscribe\" : (string) \"opted_in\" | \"subscribed\" | \"unsubscribed\",     \"email_subscribe\" : (string) \"opted_in\" | \"subscribed\" | \"unsubscribed\",     \"custom_attributes\" : (object) custom attribute key-value pairs,     \"custom_events\" : [         {             \"name\" : (string),             \"first\" : (string) date,             \"last\" : (string) date,             \"count\" : (int)         },         ...     ],     \"purchases\" : [         {             \"name\" : (string),             \"first\" : (string) date,             \"last\" : (string) date,             \"count\" : (int)         },         ...     ],     \"devices\" : [         {             \"model\" : (string),             \"os\" : (string),             \"carrier\" : (string),             \"idfv\" : (string) only included for iOS devices,             \"idfa\" : (string) only included for iOS devices when IDFA collection is enabled,             \"google_ad_id\" : (string) only included for Android devices when Google Play Advertising Identifier collection is enabled,             \"roku_ad_id\" : (string) only included for Roku devices,             \"windows_ad_id\" : (string) only included for Windows devices,             \"ad_tracking_enabled\" : (bool)         },         ...     ],     \"push_tokens\" : [         {             \"app\" : (string) app name,             \"platform\" : (string),             \"token\" : (string)         },         ...     ],     \"apps\" : [         {             \"name\" : (string),             \"platform\" : (string),             \"version\" : (string),             \"sessions\" : (integer),             \"first_used\" : (string) date,             \"last_used\" : (string) date         },         ...     ],     \"campaigns_received\" : [         {             \"name\" : (string),             \"last_received\" : (string) date,             \"engaged\" : {                 \"opened_email\" : (bool),                 \"opened_push\" : (bool),                 \"clicked_email\" : (bool),                 \"clicked_triggered_in_app_message\" : (bool)             },             \"converted\" : (bool),             \"api_campaign_id\" : (string),             \"variation_name\" : (optional, string) exists only if it is a multivariate campaign,             \"variation_api_id\" : (optional, string) exists only if it is a multivariate campaign,             \"in_control\" : (optional, bool) exists only if it is a multivariate campaign         },         ...     ],     \"canvases_received\": [         {             \"name\": (string),             \"api_canvas_id\": (string),             \"last_received_message\": (string) date,             \"last_entered\": (string) date,             \"variation_name\": (string),             \"in_control\": (bool),             \"last_exited\": (string) date,             \"steps_received\": [                 {                     \"name\": (string),                     \"api_canvas_step_id\": (string),                     \"last_received\": (string) date                 },                 {                     \"name\": (string),                     \"api_canvas_step_id\": (string),                     \"last_received\": (string) date                 },                 {                     \"name\": (string),                     \"api_canvas_step_id\": (string),                     \"last_received\": (string) date                 }             ]         },         ...     ],     \"cards_clicked\" : [         {             \"name\" : (string)         },         ...     ] }  ```

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
  @spec users_export_ids_post(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def users_export_ids_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/users/export/ids")
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
  User Profile Export by Segment
  This endpoint allows you to export all the users within a segment. User data is exported as multiple files of user JSON objects separated by new lines (i.e. one JSON object per line). Data is exported to an automatically generated URL, or to an S3 bucket if this integration is already set up.  This endpoint is currently not supported by Google Cloud Storage.  Note that a company may run at most one export per segment using this endpoint at a given time. Wait for your export to complete before retrying.  > Beginning December 2021, the following changed for this API: >  > 1\\. The fields_to_export field in this API request is required. The option to default to all fields has been removed.   > 2\\. The fields for custom_events, purchases, campaigns_received, and canvases_received only contain data from the last 90 days.  > Warning: Individual custom attributes cannot be exported. However, all custom attributes can be exported by including `custom_attributes` in the `fields_to_export` array (e.g., \\[‘first_name’, ‘email’, ‘custom_attributes’\\]).  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Credential-based response details  For information regarding credentials-based response details, visit this [section](https://www.braze.com/docs/api/endpoints/export/user_data/post_users_segment/#credentials-based-response-details) in the Braze API docs.  ## Request parameters  | Parameter | Required | Data Type | Description | | --- | --- | --- | --- | | `segment_id` | Required | String | Identifier for the segment to be exported. See [segment identifier](https://www.braze.com/docs/api/identifier_types/).  <br>  <br>The segment_id for a given segment can be found in your **Developer Console** within your Braze account or you can use the [Segment List Endpoint](https://www.braze.com/docs/api/endpoints/export/segments/get_segment/). | | `callback_endpoint` | Optional | String | Endpoint to post a download URL to when the export is available. | | `fields_to_export` | Required* | Array of strings | Name of user data fields to export, you may also export custom attributes.  <br>  <br>*Beginning April 2021, new accounts must specify specific fields to export. | | `output_format` | Optional | String | When using your own S3 bucket, allows you to specify file format as `zip` or `gzip`. Defaults to ZIP file format. |  ### Fields to export  The following is a list of valid `fields_to_export`. Using `fields_to_export` to minimize the data returned can improve response time of this API endpoint:  *   `apps` *   `attributed_campaign` *   `attributed_source` *   `attributed_adgroup` *   `attributed_ad` *   `braze_id` *   `campaigns_received` *   `canvases_received` *   `cards_clicked` *   `country` *   `created_at` *   `custom_attributes` *   `custom_events` *   `devices` *   `dob` *   `email` *   `email_subscribe` *   `external_id` *   `first_name` *   `gender` *   `home_city` *   `language` *   `last_coordinates` *   `last_name` *   `phone` *   `purchases` *   `push_subscribe` *   `push_tokens` *   `random_bucket` *   `time_zone` *   `total_revenue` *   `uninstalled_at` *   `user_aliases`       ### Important reminders  *   The fields for `custom_events`, `purchases`, `campaigns_received`, and `canvases_received` will contain only contain data from the last 90 days. *   Both `custom_events` and `purchases` contain fields for `first` and `count`. Both of these fields will reflect information from all time, and will not be limited to just data from the last 90 days. For example, if a particular user first did the event prior to 90 days ago, this will be accurately reflected in the `first` field, and the `count` field will take into account events that occurred prior to the last 90 days as well. *   The number of concurrent segment exports a company can run at the endpoint level is capped at 100. Attempts that surpass this limit will result in an error.       ### Response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"object_prefix\": (required, string) the filename prefix that will be used for the JSON file produced by this export, e.g. 'bb8e2a91-c4aa-478b-b3f2-a4ee91731ad1-1464728599',     \"url\" : (optional, string) the URL where the segment export data can be downloaded if you do not have your own S3 credentials }  ```  Once made available, the URL will only be valid for a few hours. As such, we highly recommend that you add your own S3 credentials to Braze.  ### Sample user export file output  User export object (we will include the least data possible - if a field is missing from the object it should be assumed to be null, false, or empty):  ``` json {     \"external_id\" : (string),     \"user_aliases\" : [       {         \"alias_name\" : (string),         \"alias_label\" : (string)       }     ],     \"braze_id\": (string),     \"first_name\" : (string),     \"last_name\" : (string),     \"email\" : (string),     \"dob\" : (string) date for the user's date of birth,     \"home_city\" : (string),     \"country\" : (string),     \"phone\" : (string),     \"language\" : (string) ISO-639 two letter code,     \"time_zone\" : (string),     \"last_coordinates\" : (array of float) [lon, lat],     \"gender\" : (string) \"M\" | \"F\",     \"total_revenue\" : (float),     \"attributed_campaign\" : (string),     \"attributed_source\" : (string),     \"attributed_adgroup\" : (string),     \"attributed_ad\" : (string),     \"push_subscribe\" : (string) \"opted_in\" | \"subscribed\" | \"unsubscribed\",     \"email_subscribe\" : (string) \"opted_in\" | \"subscribed\" | \"unsubscribed\",     \"custom_attributes\" : (object) custom attribute key value pairs,     \"custom_events\" : [         {             \"name\" : (string),             \"first\" : (string) date,             \"last\" : (string) date,             \"count\" : (int)         },         ...     ],     \"purchases\" : [         {             \"name\" : (string),             \"first\" : (string) date,             \"last\" : (string) date,             \"count\" : (int)         },         ...     ],     \"devices\" : [         {             \"model\" : (string),             \"os\" : (string),             \"carrier\" : (string),             \"idfv\" : (string) only included for iOS devices,             \"idfa\" : (string) only included for iOS devices when IDFA collection is enabled,             \"google_ad_id\" : (string) only included for Android devices when Google Play Advertising Identifier collection is enabled,             \"roku_ad_id\" : (string) only included for Roku devices,             \"windows_ad_id\" : (string) only included for Windows devices,             \"ad_tracking_enabled\" : (bool)         },         ...     ],     \"push_tokens\" : [         {             \"app\" : (string) app name,             \"platform\" : (string),             \"token\" : (string)         },         ...     ],     \"apps\" : [         {             \"name\" : (string),             \"platform\" : (string),             \"version\" : (string),             \"sessions\" : (string),             \"first_used\" : (string) date,             \"last_used\" : (string) date         },         ...     ],     \"campaigns_received\" : [         {             \"name\" : (string),             \"last_received\" : (string) date,             \"engaged\" : {                 \"opened_email\" : (bool),                 \"opened_push\" : (bool),                 \"clicked_email\" : (bool),                 \"clicked_in_app_message\" : (bool)             },             \"converted\" : (bool),             \"api_campaign_id\" : (string),             \"variation_name\" : (optional, string) exists only if it is a multivariate campaign,             \"variation_api_id\" : (optional, string) exists only if it is a multivariate campaign,             \"in_control\" : (optional, bool) exists only if it is a multivariate campaign         },         ...     ],     \"canvases_received\": [         {             \"name\": (string),             \"api_canvas_id\": (string),             \"last_received_message\": (string) date,             \"last_entered\": (string) date,             \"variation_name\": (string),             \"in_control\": (bool),             \"last_exited\": (string) date,             \"steps_received\": [                 {                     \"name\": (string),                     \"api_canvas_step_id\": (string),                     \"last_received\": (string) date                 },                 {                     \"name\": (string),                     \"api_canvas_step_id\": (string),                     \"last_received\": (string) date                 },                 {                     \"name\": (string),                     \"api_canvas_step_id\": (string),                     \"last_received\": (string) date                 }             ]         },         ...     ],     \"cards_clicked\" : [         {             \"name\" : (string)         },         ...     ] }  ```

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
  @spec users_export_segment_post(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def users_export_segment_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/users/export/segment")
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
