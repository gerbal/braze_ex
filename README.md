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
  [{:braze_ex, "~> 1.0.3"}]
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
