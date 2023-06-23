# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.ExportCanvas do
  @moduledoc """
  API calls for all endpoints tagged `ExportCanvas`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## Export Canvas Data Series Analytics

  > Use this endpoint to export time series data for a Canvas. 


  To use this endpoint, you’ll need to generate an API key with the `canvas.data_series` permission.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "data": {
    "name": (string) Canvas name,
    "stats": [
      {
        "time": (string) date as ISO 8601 date,
        "total_stats": {
          "revenue": (float),
          "conversions": (int),
          "conversions_by_entry_time": (int),
          "entries": (int)
        },
        "variant_stats": (optional) {
          "00000000-0000-0000-0000-0000000000000": (API identifier for variant) {
            "name": (string) name of variant,
            "revenue": (int),
            "conversions": (int),
            "conversions_by_entry_time": (int),
            "entries": (int)
          },
          ... (more variants)
        },
        "step_stats": (optional) {
          "00000000-0000-0000-0000-0000000000000": (API identifier for step) {
            "name": (string) name of step,
            "revenue": (float),
            "conversions": (int),
            "conversions_by_entry_time": (int),
            "messages": {
              "email": [
                {
                  "sent": (int),
                  "opens": (int),
                  "unique_opens": (int),
                  "clicks": (int),
                  ... (more stats)
                }
              ],
              ... (more channels)
            }
          },
          ... (more steps)
        }
      },
      ... (more stats by time)
    ]
  },
  "message": (required, string) the status of the export, returns 'success' when completed without errors
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:canvas_id` (String.t): (Required) String  See [Canvas API Identifier](https://www.braze.com/docs/api/identifier_types/).
    - `:ending_at` (String.t): (Required) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Date on which the data export should end. Defaults to time of the request.
    - `:starting_at` (String.t): (Optional*) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)   Date on which the data export should begin.  *Either `length` or `starting_at` is required.
    - `:length` (integer()): (Optional*) String  Maximum number of days before `ending_at` to include in the returned series. Must be between 1 and 14 (inclusive).  *Either `length` or `starting_at` is required.
    - `:include_variant_breakdown` (boolean()): (Optional) Boolean  Whether or not to include variant stats (defaults to false).
    - `:include_step_breakdown` (boolean()): (Optional) Boolean  Whether or not to include step stats (defaults to false).
    - `:include_deleted_step_data` (boolean()): (Optional) Boolean  Whether or not to include step stats for deleted steps (defaults to false).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec canvas_data_series_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_data_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :canvas_id => :query,
      :ending_at => :query,
      :starting_at => :query,
      :length => :query,
      :include_variant_breakdown => :query,
      :include_step_breakdown => :query,
      :include_deleted_step_data => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/canvas/data_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Export Canvas Data Analytics Summary

  > Use this endpoint to export rollups of time series data for a Canvas, providing a concise summary of a Canvas’ results. 


  To use this endpoint, you’ll need to generate an API key with the `canvas.data_summary` permission.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "data": {
    "name": (string) Canvas name,
    "total_stats": {
      "revenue": (float),
      "conversions": (int),
      "conversions_by_entry_time": (int),
      "entries": (int)
    },
    "variant_stats": (optional) {
      "00000000-0000-0000-0000-0000000000000": (API identifier for variant) {
        "name": (string) name of variant,
        "revenue": (float),
        "conversions": (int),
        "entries": (int)
      },
      ... (more variants)
    },
    "step_stats": (optional) {
      "00000000-0000-0000-0000-0000000000000": (API identifier for step) {
        "name": (string) name of step,
        "revenue": (float),
        "conversions": (int),
        "conversions_by_entry_time": (int),
        "messages": {
          "android_push": (name of channel) [
            {
              "sent": (int),
              "opens": (int),
              "influenced_opens": (int),
              "bounces": (int)
              ... (more stats for channel)
            }
          ],
          ... (more channels)
        }
      },
      ... (more steps)
    }
  },
  "message": (required, string) the status of the export, returns 'success' when completed without errors
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://desktop.postman.com/?desktopVersion=9.19.0&userId=16580579&teamId=409325).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:canvas_id` (String.t): (Required) String   See [Canvas API identifier](https://www.braze.com/docs/api/identifier_types/).
    - `:ending_at` (String.t): (Required) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string) Date on which the data export should end. Defaults to time of the request
    - `:starting_at` (String.t): (Optional*) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Date on which the data export should begin.  *Either `length` or `starting_at` is required.
    - `:length` (integer()): (Optional*) Integer  Max number of days before `ending_at` to include in the returned series. Must be between 1 and 14 (inclusive).  *Either `length` or `starting_at` is required.
    - `:include_variant_breakdown` (boolean()): (Optional) Boolean  Whether or not to include variant stats (defaults to false).
    - `:include_step_breakdown` (boolean()): (Optional) Boolean  Whether or not to include step stats (defaults to false).
    - `:include_deleted_step_data` (boolean()): (Optional) Boolean  Whether or not to include step stats for deleted steps (defaults to false).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec canvas_data_summary_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_data_summary_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :canvas_id => :query,
      :ending_at => :query,
      :starting_at => :query,
      :length => :query,
      :include_variant_breakdown => :query,
      :include_step_breakdown => :query,
      :include_deleted_step_data => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/canvas/data_summary")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Export Canvas Details

  > Use this endpoint to export metadata about a Canvas, such as the name, time created, current status, and more. 


  To use this endpoint, you’ll need to generate an API key with the `canvas.details` permission.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  Note: All Canvas steps have a next_paths field, which is an array of `{name, next_step_id}` data. For full steps and Message steps, the `next_step_ids` field will be present, but will not contain data for other Canvas Flow steps.

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "created_at": (string) date created as ISO 8601 date,
  "updated_at": (string) date updated as ISO 8601 date,
  "name": (string) Canvas name,
  "description": (string) Canvas description,
  "archived": (boolean) whether this Canvas is archived,
  "draft": (boolean) whether this Canvas is a draft,
  "schedule_type": (string) type of scheduling action,
  "first_entry": (string) date of first entry as ISO 8601 date,
  "last_entry": (string) date of last entry as ISO 8601 date,
  "channels": (array of strings) step channels used with Canvas,
  "variants": [
    {
      "name": (string) name of variant,
      "id": (string) API identifier of the variant,
      "first_step_ids": (array of strings) API identifiers for first steps in variant,
      "first_step_id": (string) API identifier of first step in variant (deprecated in November 2017, only included if the variant has only one first step)
    },
    ... (more variations)
  ],
  "tags": (array of strings) tag names associated with the Canvas,
  "steps": [
    {
      "name": (string) name of step,
      "id": (string) API identifier of the step,
      "next_step_ids": (array of strings) API identifiers of steps following step,
      "channels": (array of strings) channels used in step,
      "messages": {
          "message_variation_id": (string) {  // <=This is the actual id
              "channel": (string) channel type of the message (eg., "email"),
              ... channel-specific fields for this message, see Campaign Details Endpoint API Response for example message responses ...
          }
      }
    },
    ... (more steps)
  ],
  "message": (required, string) the status of the export, returns 'success' when completed without errors
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://desktop.postman.com/?desktopVersion=9.19.0&userId=16580579&teamId=409325).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:canvas_id` (String.t): (Required) String  See [Canvas API Identifier](https://www.braze.com/docs/api/identifier_types/) 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec canvas_details_get(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_details_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :canvas_id => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/canvas/details")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Export Canvas List

  > Use this endpoint to export a list of Canvases, including the name, Canvas API identifier and associated tags. 


  Canvases are returned in groups of 100 sorted by time of creation (oldest to newest by default).

  Archived Canvases will not be included in the API response unless the `include_archived` field is specified. Canvases that are stopped but not archived, however, will be returned by default.

  To use this endpoint, you’ll need to generate an API key with the `canvas.list` permission.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "canvases" : [
      {
          "id" : (string) Canvas API Identifier,
          "last_edited": (ISO 8601 string) the last edited time for the message,
          "name" : (string) Canvas name,
          "tags" : (array) tag names associated with the Canvas,
      },
    ... (more Canvases)
  ],
  "message": (required, string) the status of the export, returns 'success' when completed without errors
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://desktop.postman.com/?desktopVersion=9.19.0&userId=16580579&teamId=409325).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:page` (integer()): (Optional) Integer  The page of Canvases to return, defaults to `0` (returns the first set of up to 100).
    - `:include_archived` (boolean()): (Optional) Boolean  Whether or not to include archived Canvases, defaults to `false`.
    - `:sort_direction` (String.t): (Optional) String  - Sort creation time from newest to oldest: pass in the value `desc`. - Sort creation time from oldest to newest: pass in the value `asc`.  If `sort_direction` is not included, the default order is oldest to newest.
    - `:last_edit_periodtime_left_square_bracketgt_right_square_bracket` (String.t): (Optional) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Filters the results and only returns Canvases that were edited greater than the time provided till now. Format is `yyyy-MM-DDTHH:mm:ss`.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec canvas_list_get(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_list_get(connection, opts \\ []) do
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
      |> url("/canvas/list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
