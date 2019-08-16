defmodule ExLaunchDarkly.App do
  @spec start(String.t()) :: :ok | {:error, any(), any()}
  def start(key), do: :eld.start_instance(key)

  @spec start(String.t(), atom()) :: :ok | {:error, any(), any()}
  def start(key, tag) when is_atom(tag), do: :eld.start_instance(key, tag)

  @spec stop_all() :: :ok
  def stop_all, do: :eld.stop_all_instances()
end
