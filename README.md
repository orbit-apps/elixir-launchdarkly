# ExLaunchDarkly

A quick Elixir wrapper around the official LaunchDarkly [Erlang library](https://github.com/launchdarkly/erlang-server-sdk)

## Installation

```elixir
def deps do
  [
    {:ex_launch_darkly, github: "pixelunion/elixir-launchdarkly", tag: "v0.4.1"}
  ]
end
```

## Usage

Start your connection to LaunchDarkly on Application start.

```elixir
ExLaunchDarkly.App.start(Application.fetch_env!(:your_application, :launchdarkly_api_key))
```

Retrieve a variation.

```elixir
ExLaunchDarkly.variation("Some-Flag", ExLaunchDarkly.User.new("SomeUser"), false)
```

## Testing

You can configure LaunchDarkly to only use a [test data source](https://docs.launchdarkly.com/sdk/features/test-data-sources#erlang):
```elixir
ExLaunchDarkly.App.start(
  "fake-key",
  :default,
  %{
    datasource: :testdata,
    send_events: false,
    feature_store: :ldclient_storage_map
  }
)
```
