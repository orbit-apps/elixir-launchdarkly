defmodule ExLaunchDarkly.App do
  @default_instance_name :default
  @test_options %{
    datasource: :testdata,
    send_events: false,
    feature_store: :ldclient_storage_map
  }

  @spec start(String.t(), atom(), map()) :: :ok | {:error, any(), any()}
  @spec start(String.t(), map()) :: :ok | {:error, any(), any()}
  @spec start(String.t(), atom()) :: :ok | {:error, any(), any()}
  def start(key, tag, %{} = options) when is_binary(key) and is_atom(tag) do
    options =
      Map.merge(%{http_options: %{tls_options: :ldclient_config.tls_basic_options()}}, options)

    key |> String.to_charlist() |> :ldclient.start_instance(tag, options)
  end

  def start(key, options \\ %{})

  def start(key, %{} = options) when is_binary(key),
    do: start(key, @default_instance_name, options)

  def start(key, tag) when is_binary(key) and is_atom(tag), do: start(key, tag, %{})

  @spec stop_all() :: :ok
  def stop_all, do: :ldclient.stop_all_instances()

  def test_options, do: @test_options
end
