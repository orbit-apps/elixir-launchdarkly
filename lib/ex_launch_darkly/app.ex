defmodule ExLaunchDarkly.App do
  @spec start(String.t()) :: :ok | {:error, any(), any()}
  def start(key) when is_binary(key),
    do: key |> String.to_charlist() |> :ldclient.start_instance()

  @spec start(String.t(), atom() | map()) :: :ok | {:error, any(), any()}
  def start(key, tag_or_map) when is_binary(key) and (is_atom(tag_or_map) or is_map(tag_or_map)),
    do: key |> String.to_charlist() |> :ldclient.start_instance(tag_or_map)

  @spec stop_all() :: :ok
  def stop_all, do: :ldclient.stop_all_instances()
end
