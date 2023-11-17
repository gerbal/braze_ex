# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.TemplatesEmailTemplates do
  @moduledoc """
  API calls for all endpoints tagged `TemplatesEmailTemplates`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  ## Create Email Template

  > Use this endpoint to create email templates on the Braze dashboard. 


  To use this endpoint, you’ll need to generate an API key with the `templates.email.create` permission.

  These templates will be available on the **Templates & Media** page. The response from this endpoint will include a field for `email_template_id`, which can be used to update the template in subsequent API calls.

  Users’ email subscription status can be updated and retrieved via Braze using a RESTful API. You can use the API to set up bi-directional sync between Braze and other email systems or your own database. All API requests are made over HTTPS.

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `template_name` | Required | String | Name of your email template. |
  | `subject` | Required | String | Email template subject line. |
  | `body` | Required | String | Email template body that may include HTML. |
  | `plaintext_body` | Optional | String | A plaintext version of the email template body. |
  | `preheader` | Optional | String | Email preheader used to generate previews in some clients. |
  | `tags` | Optional | String | [Tags](https://www.braze.com/docs/user_guide/administrative/app_settings/manage_app_group/tags/) must already exist. |
  | `should_inline_css` | Optional | Boolean | Enables or disables the `inline_css` feature per template. If not provided, Braze will use the default setting for the app group. One of `true` or `false` is expected. |

  ### Possible errors

  The following table lists possible returned errors and their associated troubleshooting steps, if applicable.

  | Error | Troubleshooting |
  | --- | --- |
  | Template name is required | Enter a template name. |
  | Tags must be an array | Tags must be formatted as an array of strings, for example `["marketing", "promotional", "transactional"]`. |
  | All tags must be strings | Make sure your tags are encapsulated in quotes (`""`). |
  | Some tags could not be found | To add a tag when creating an email template, the tag must already exist in Braze. |
  | Email must have valid Content Block names | The email contains Content Blocks that don't exist in this environment. |
  | Invalid value for `should_inline_css`. One of `true` or `false` was expected | This parameter only accepts boolean values (true or false). Make sure the value for `should_inline_css` is not encapsulated in quotes (`""`), which causes the value to be sent as a string instead. |

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
  @spec templates_email_create_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def templates_email_create_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/templates/email/create")
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
  ## See Email Template Information

  > Use this endpoint to get information on your email templates. 


  To use this endpoint, you’ll need to generate an API key with the `templates.email.info` permission.

  > **Important:** Templates built using the drag-and-drop editor for email are not accepted. 


  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "email_template_id": (string) your email template's API Identifier,
  "template_name": (string) the name of your email template,
  "description": (string) email template description,
  "subject": (string) the email template subject line,
  "preheader": (optional, string) the email preheader used to generate previews in some clients),
  "body": (optional, string) the email template body that may include HTML,
  "plaintext_body": (optional, string) a plaintext version of the email template body,
  "should_inline_css": (optional, boolean) whether there is inline CSS in the body of the template - defaults to the css inlining value for the App Group,
  "tags": (string) tag names,
  "created_at": (string, in ISO 8601),
  "updated_at": (string, in ISO 8601)
  }

  ```

  Images in this response will show in the `body` variable as HTML.

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:Authorization` (String.t): 
    - `:email_template_id` (String.t): (Required) String  See [email template's API identifier](https://www.braze.com/docs/api/identifier_types/).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec templates_email_info_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def templates_email_info_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :email_template_id => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/templates/email/info")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## List Available Email Templates

  > Use this endpoint to get a list of available templates in your Braze account. 


  To use this endpoint, you’ll need to generate an API key with the `templates.email.list` permission.

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Response

  > **Important:** Templates built using the Drag & Drop Editor for email are not provided in this response. 


  ``` json
  {
  "count": number of templates returned
  "templates": [template with the following properties]:
    "email_template_id": (string) your email template's API Identifier,
    "template_name": (string) the name of your email template,
    "created_at": (string, in ISO 8601),
    "updated_at": (string, in ISO 8601),
    "tags": (array of strings) tags appended to the template
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:Authorization` (String.t): 
    - `:modified_after` (String.t): (Optional) String in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)  Retrieve only templates updated at or after the given time.
    - `:modified_before` (String.t): (Optional) String in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)  Retrieve only templates updated at or before the given time.
    - `:limit` (integer()): (Optional) Positive Number  Maximum number of templates to retrieve. Default to 100 if not provided, with a maximum acceptable value of 1000.
    - `:offset` (integer()): (Optional) Positive Number  Number of templates to skip before returning rest of the templates that fit the search criteria.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec templates_email_list_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def templates_email_list_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :modified_after => :query,
      :modified_before => :query,
      :limit => :query,
      :offset => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/templates/email/list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Update Email Template

  > Use this endpoint to update email templates on the Braze dashboard. 


  To use this endpoint, you’ll need to generate an API key with the `templates.email.update` permission.

  You can access an email template’s `email_template_id` by navigating to it on the **Templates & Media** page. The [Create email template endpoint](https://www.braze.com/docs/api/endpoints/templates/email_templates/post_create_email_template/) will also return an `email_template_id` reference.

  All fields other than the `email_template_id` are optional, but you must specify at least one field to update.

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `email_template_id` | Required | String | Your [email template's API identifier](https://www.braze.com/docs/api/identifier_types/). |
  | `template_name` | Optional | String | Name of your email template. |
  | `subject` | Optional | String | Email template subject line. |
  | `body` | Optional | String | Email template body that may include HTML. |
  | `plaintext_body` | Optional | String | A plaintext version of the email template body. |
  | `preheader` | Optional | String | Email preheader used to generate previews in some clients. |
  | `tags` | Optional | String | [Tags](https://www.braze.com/docs/user_guide/administrative/app_settings/manage_app_group/tags/) must already exist. |
  | `should_inline_css` | Optional | Boolean | Enables or disables the `inline_css` feature per template. If not provided, Braze will use the default setting for the AppGroup. One of `true` or `false` is expected. |

  ### Possible errors

  The following table lists possible returned errors and their associated troubleshooting steps, if applicable.

  | Error | Troubleshooting |
  | --- | --- |
  | Template name is required |  |
  | Tags must be an array | Tags must be formatted as an array of strings, for example `["marketing", "promotional", "transactional"]`. |
  | All tags must be strings | Make sure your tags are encapsulated in quotes (`""`). |
  | Some tags could not be found | To add a tag when creating an email template, the tag must already exist in Braze. |
  | Invalid value for `should_inline_css`. One of `true` or `false` was expected | This parameter only accepts boolean values (true or false). Make sure the value for `should_inline_css` is not encapsulated in quotes (`""`), which causes the value to be sent as a string instead. |

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
  @spec templates_email_update_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def templates_email_update_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/templates/email/update")
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
