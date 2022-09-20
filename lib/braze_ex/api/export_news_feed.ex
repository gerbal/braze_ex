# NOTE: This file is auto generated by OpenAPI Generator 6.1.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.ExportNewsFeed do
  @moduledoc """
  API calls for all endpoints tagged `ExportNewsFeed`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  News Feed Card Analytics
  This endpoint allows you to retrieve a daily series of engagement stats for a card over time.  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"data\" : [         {             \"time\" : (string) point in time - as ISO 8601 extended when unit is \"hour\" and as ISO 8601 date when unit is \"day\",             \"clicks\" : (int) ,             \"impressions\" : (int),             \"unique_clicks\" : (int),             \"unique_impressions\" : (int)         },         ...     ] }  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:card_id` (String.t): (Required) String  See [Card API identifier](https://www.braze.com/docs/api/identifier_types/).  The `card_id` for a given card can be found in the **Developer Console** page and on the card details page within your dashboard, or you can use the [News Feed List Endpoint](https://www.braze.com/docs/api/endpoints/export/news_feed/get_news_feed_cards/).
    - `:length` (integer()): (Required) Integer  Max number of units (days or hours) before `ending_at` to include in the returned series. Must be between 1 and 100 (inclusive).
    - `:unit` (String.t): (Optional) String  Unit of time between data points. Can be `day` or `hour`, defaults to `day`.
    - `:ending_at` (String.t): (Optional) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Date on which the data series should end. Defaults to time of the request. 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec feed_data_series_get(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def feed_data_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :card_id => :query,
      :length => :query,
      :unit => :query,
      :ending_at => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/feed/data_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  News Feed Cards Details
  This endpoint allows you to retrieve relevant information on the card, which can be identified by the `card_id`.  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) The status of the export, returns 'success' when completed without errors,     \"created_at\" : (string) Date created as ISO 8601 date,     \"updated_at\" : (string) Date last updated as ISO 8601 date,     \"name\" : (string) Card name,     \"publish_at\" : (string) Date card was published as ISO 8601 date,     \"end_at\" : (string) Date card will stop displaying for users as ISO 8601 date,     \"tags\" : (array) Tag names associated with the card,     \"title\" : (string) Title of the card,     \"image_url\" : (string) Image URL used by this card,     \"extras\" : (dictionary) Dictionary containing key-value pair data attached to this card,     \"description\" : (string) Description text used by this card,     \"archived\": (boolean) whether this Card is archived,     \"draft\": (boolean) whether this Card is a draft, }  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:card_id` (String.t): (Required) String  See [Card API identifier](https://www.braze.com/docs/api/identifier_types/).  The `card_id` for a given card can be found in the **Developer Console** page and on the card details page within your dashboard, or you can use the [News Feed List Endpoint](https://www.braze.com/docs/api/endpoints/export/news_feed/get_news_feed_cards/).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec feed_details_get(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def feed_details_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :card_id => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/feed/details")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  News Feed Cards List
  This endpoint allows you to export a list of News Feed cards, each of which will include its name and Card API Identifier. The cards are returned in groups of 100 sorted by time of creation (oldest to newest by default).  ## Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Response  ``` json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"message\": (required, string) the status of the export, returns 'success' when completed without errors,     \"cards\" : [         {             \"id\" : (string) Card API Identifier,             \"type\" : (string) type of the card - NewsItem (classic cards), CaptionedImage, Banner or DevPick (cross-promotional cards),             \"title\" : (string) title of the card,             \"tags\" : (array) tag names associated with the card         },         ...     ] }  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:page` (integer()): (Optional) Integer  The page of cards to return, defaults to 0 (returns the first set of up to 100).
    - `:include_archived` (boolean()): (Optional) Boolean  Whether or not to include archived cards, defaults to false.
    - `:sort_direction` (String.t): (Optional) String  - Sort creation time from newest to oldest: pass in the value `desc`. - Sort creation time from oldest to newest: pass in the value `asc`.  If `sort_direction` is not included, the default order is oldest to newest.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec feed_list_get(Tesla.Env.client, keyword()) :: {:ok, nil} | {:error, Tesla.Env.t}
  def feed_list_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :page => :query,
      :include_archived => :query,
      :sort_direction => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/feed/list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end
end
