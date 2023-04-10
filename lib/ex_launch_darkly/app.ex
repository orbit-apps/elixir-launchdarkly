defmodule ExLaunchDarkly.App do
  @spec start(String.t(), atom(), map()) :: :ok | {:error, any(), any()}
  def start(key, tag \\ :default, options \\ %{})
      when is_binary(key) and is_atom(tag) and is_map(options) do
    options =
      Map.merge(
        %{
          :http_options => %{
            :tls_options => :ldclient_config.tls_basic_options()
          }
        },
        options
      )

    key |> String.to_charlist() |> :ldclient.start_instance(tag, options)
  end

  @spec stop_all() :: :ok
  def stop_all, do: :ldclient.stop_all_instances()
end
