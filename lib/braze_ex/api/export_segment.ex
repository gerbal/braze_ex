# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.ExportSegment do
  @moduledoc """
  API calls for all endpoints tagged `ExportSegment`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## Export Segment Analytics

  > Use this endpoint to retrieve a daily series of the estimated size of a segment over time. 


  Note: If you are using our [older navigation](https://www.braze.com/docs/navigation), `segment_id` can be found at **Developer Console > API Settings**.

  To use this endpoint, you’ll need to generate an API key with the `segments.data_series` permission.

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
    "message": (required, string) the status of the export, returns 'success' when completed without errors,
    "data" : [
        {
            "time" : (string) date as ISO 8601 date,
            "size" : (int) size of the segment on that date
        },
        ...
    ]
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:segment_id` (String.t): (Required) String  See [Segment API identifier](https://www.braze.com/docs/api/identifier_types/).  The `segment_id` for a given segment can be found in your **Settings > Setup and Testing > API Keys.** within your Braze account or you can use the [Segment List Endpoint](https://www.braze.com/docs/api/endpoints/export/get_segment/).
    - `:length` (integer()): (Required) Integer  Max number of days before `ending_at` to include in the returned series - must be between 1 and 100 (inclusive).
    - `:ending_at` (String.t): (Optional) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Date on which the data series should end. Defaults to time of the request.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec segments_data_series_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def segments_data_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :segment_id => :query,
      :length => :query,
      :ending_at => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/segments/data_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Export Segment Details

  > Use this endpoint to retrieve relevant information on a segment, which can be identified by the `segment_id`. 


  Note: If you are using our [older navigation](https://www.braze.com/docs/navigation), `segment_id` can be found at **Developer Console > API Settings**.

  To use this endpoint, you’ll need to generate an API key with the `segments.details` permission.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
      "message": (required, string) the status of the export, returns 'success' when completed without errors,
      "created_at" : (string) date created as ISO 8601 date,
      "updated_at" : (string) date last updated as ISO 8601 date,
      "name" : (string) segment name,
      "description" : (string) human-readable description of filters,
      "text_description" : (string) segment description, 
      "tags" : (array) tag names associated with the segment
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:segment_id` (String.t): (Required) String  See [Segment API identifier](https://www.braze.com/docs/api/identifier_types/).  The `segment_id` for a given segment can be found in your **Settings > Setup and Testing > API Keys** within your Braze account or you can use the [Segment List Endpoint](https://www.braze.com/docs/api/endpoints/export/get_segment/).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec segments_details_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def segments_details_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :segment_id => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/segments/details")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Export Segment List

  > Use this endpoint to export a list of segments, each of which will include its name, Segment API identifier, and whether it has analytics tracking enabled. 


  The segments are returned in groups of 100 sorted by time of creation (oldest to newest by default). Archived segments are not included.

  To use this endpoint, you’ll need to generate an API key with the `segments.list` permission.

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
    "message": (required, string) the status of the export, returns 'success' when completed without errors,
    "segments" : [
        {
            "id" : (string) Segment API Identifier,
            "name" : (string) segment name,
            "analytics_tracking_enabled" : (boolean) whether the segment has analytics tracking enabled,
            "tags" : (array) tag names associated with the segment
        },
        ...
    ]
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:page` (integer()): (Optional) Integer  The page of segments to return, defaults to 0 (returns the first set of up to 100).
    - `:sort_direction` (String.t): (Optional) String  - Sort creation time from newest to oldest: pass in the value `desc`. - Sort creation time from oldest to newest: pass in the value `asc`.  If `sort_direction` is not included, the default order is oldest to newest.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec segments_list_get(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def segments_list_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :page => :query,
      :sort_direction => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/segments/list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
