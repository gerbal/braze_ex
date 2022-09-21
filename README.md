# BrazeEx

Braze HTTP API (generated from Braze Postman Collection)

## Building

To install the required dependencies and to build the elixir project, run:

```console
mix local.hex --force
mix do deps.get, compile
```

## Installation

If [available in Hex][], the package can be installed by adding `braze_ex` to
your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:braze_ex, "~> 1.0.1"}]
end
```

Documentation can be generated with [ExDoc][] and published on [HexDocs][]. Once published, the docs can be found at
[https://hexdocs.pm/braze_ex][docs].

## Configuration

You can override the URL of your server (e.g. if you have a separate development and production server in your
configuration files).

```elixir
config :braze_ex, base_url: "https://}"
```

Multiple clients for the same API with different URLs can be created passing different `base_url`s when calling
`BrazeEx.Connection.new/1`:

```elixir
client = BrazeEx.Connection.new(base_url: "https://}")
```

[exdoc]: https://github.com/elixir-lang/ex_doc
[hexdocs]: https://hexdocs.pm
[available in hex]: https://hex.pm/docs/publish
[docs]: https://hexdocs.pm/braze_ex

## Usage

TODO .. examples of usage to come as we use this internally

# Development

This API is generated using [OpenApiGenerator](https://openapi-generator.tech/) from the [Braze Postman Collection](https://documenter.getpostman.com/view/4689407/SVYrsdsG).

Requirements:

- [asdf](https://asdf-vm.com/), which installs all of the necessary tools and versions
- [just](https://just.systems/man/en/), which runs the build scripts from the [justfile](justfile)

To Rebuild the API using the latest postman collection revision run `just build`

# Braze API overview

Braze provides a high-performance REST API to allow you to track users, send messages, export data, and more. This reference article covers what a REST API is, the terminology, a brief overview of API keys, and API limits.

A REST API is a way to programmatically transfer information over the web using a predefined schema. Braze has created many different endpoints which perform various actions and/or return various data.

Braze manages a number of different instances for our dashboard and REST Endpoints. When your account is provisioned you will log in to one of the following URLs. Use the correct REST endpoint based on which instance you are provisioned to. If you are unsure, open a [support ticket](https://www.braze.com/docs/braze_support/) or use the following table to match the URL of the dashboard you use to the correct REST Endpoint.

> Customers using Braze’s EU database should use the `https://rest.fra-01.braze.eu/` endpoint. This endpoint will be used when configuring the Braze [iOS](https://www.braze.com/docs/developer_guide/platform_integration_guides/ios/initial_sdk_setup/completing_integration/#compile-time-endpoint-configuration-recommended), [Android](https://www.braze.com/docs/developer_guide/platform_integration_guides/android/initial_sdk_setup/android_sdk_integration/#step-2-configure-the-braze-sdk-in-brazexml), and [Web](https://www.braze.com/docs/developer_guide/platform_integration_guides/web/initial_sdk_setup/#step-2-initialize-braze) SDKs.

## Braze Instances

| Instance | Dashboard URL | REST Endpoint |
| --- | --- | --- |
| US-01 | `https://dashboard.braze.com` or  <br>`https://dashboard-01.braze.com` | `https://rest.iad-01.braze.com` |
| US-02 | `https://dashboard-02.braze.com` | `https://rest.iad-02.braze.com` |
| US-03 | `https://dashboard-03.braze.com` | `https://rest.iad-03.braze.com` |
| US-04 | `https://dashboard-04.braze.com` | `https://rest.iad-04.braze.com` |
| US-05 | `https://dashboard-05.braze.com` | `https://rest.iad-05.braze.com` |
| US-06 | `https://dashboard-06.braze.com` | `https://rest.iad-06.braze.com` |
| US-08 | `https://dashboard-08.braze.com` | `https://rest.iad-08.braze.com` |
| EU-01 | `https://dashboard-01.braze.eu` | `https://rest.fra-01.braze.eu` |
| EU-02 | `https://dashboard-02.braze.eu` | `https://rest.fra-02.braze.eu` |

# Using Braze's Postman collection

If you have a Postman account (you can download macOS, Windows, and Linux versions from the [Postman website](https://www.getpostman.com/) ), you can open our Postman documentation in your own Postman app by clicking the orange **Run in Postman** button. You can then [create an environment](https://www.braze.com/docs/api/postman_collection/#setting-up-your-postman-environment), or use our Braze REST API environment as a template, and edit the available `POST` and `GET` requests to suit your own needs.

## Setting up your Postman environment

The Braze Postman Collection uses a templating variable, `{{instance_url}}`, to substitute the REST API URL of your Braze instance into the pre-built requests, and the `{{api_key}}` variable for your API Key. Rather than having to manually edit all requests in the Collection, you can set up this variable in your Postman environment. You can either select our templated environment (Braze REST API Environment Template) from the dropdown and replace the variable values with your own, or you can set up your own environment.

To set up your own environment, perform the following steps:

1.  From the **Workspaces** tab, select **Environments**.
2.  Click the **+** plus button to create a new environment.
3.  Give this environment a name (e.g., “Braze API Requests”) and add keys for `instance_url` and `api_key` with values corresponding to your [Braze instance](https://www.braze.com/docs/developer_guide/rest_api/basics/#endpoints) and [Braze REST API Key](https://www.braze.com/docs/api/api_key/).
4.  Click **Save**.
    

## Using the pre-built requests from the collection

Once you have configured your environment. You can use any of the pre-built requests in the collection as a template for building new API requests. To start using one of the pre-built requests, click on it within the **Collections** menu of Postman. This will open the request as a new tab in the main window of the Postman app.

In general, there are two types of requests that Braze’s API endpoints accept - `GET` and `POST`. Depending on which `HTTP` method the endpoint uses, you’ll need to edit the pre-built request differently.

### Edit a POST request

When editing a `POST` request, open the request and navigate to the **Body** section in the request editor. For readability, select the **raw** radio button to format the `JSON` request body.

### Edit a GET request

When editing a `GET` request, edit the parameters passed in the request URL. To do so, select the **Params** tab and edit the key-value pairs in the fields that appear.

## Send your request

Once your API request is ready, click **Send**. The request sends and the response data populates in a section underneath the request editor. From here, you can view the raw data returned from Braze’s API, see the HTTP response code, see how long the request took to process, and view header information.

The following documentation can be found on the Braze documentation site:

*   [Object & filter specifications](https://www.braze.com/docs/api/objects_filters/)
*   [API key overview](https://www.braze.com/docs/api/api_key/)
*   [API identifier types](https://www.braze.com/docs/api/identifier_types/)
*   [Errors & responses](https://www.braze.com/docs/api/errors/)
*   [Parameters](https://www.braze.com/docs/api/parameters)
*   [Data retention](https://www.braze.com/docs/api/data_retention/)
*   [API network connectivity issues](https://www.braze.com/docs/api/network_connectivity_issues)
*   [Rate limits](https://www.braze.com/docs/api/api_limits/)
*   [API campaigns](https://www.braze.com/docs/api/api_campaigns/)
