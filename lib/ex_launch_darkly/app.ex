defmodule ExLaunchDarkly.App do
  @spec start(String.t()) :: :ok | {:error, any(), any()}
  def start(key) when is_binary(key),
    do: key |> String.to_charlist() |> :ldclient.start_instance()

  @spec start(String.t(), atom()) :: :ok | {:error, any(), any()}
  def start(key, tag) when is_binary(key) and is_atom(tag),
    do: key |> String.to_charlist() |> :ldclient.start_instance(tag)

  @spec stop_all() :: :ok
  def stop_all, do: :ldclient.stop_all_instances()
end
