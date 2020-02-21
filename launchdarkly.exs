defmodule ExLaunchDarkly do
  @spec variation(String.t(), :ldclient_user.user(), ldclient_eval.result_value())
  def variant(flag_key, user, default_value), do: :ldclient.variation(flag_key, user, default_value)
  @spec variation(String.t(), :ldclient_user.user(), ldclient_eval.result_value(), atom())
  def variant(flag_key, user, default_value, tag), do: :ldclient.variation(flag_key, user, default_value, tag)
end

defmodule ExLaunchDarkly.App do
  @spec start(String.t())
  def start(key), do: :ldclient.start_instance(key)
  @spec start(String.t(), atom())
  def start(key, tag) when is_atom(tag), do: :ldclient.start_instance(key, tag)

  def stop_all, do: :ldclient.stop_all_instances()
end

defmodule ExLaunchDarkly.User do
  @spec new(String.t())
  def new(key), do: :ldclient_user.new(key)
end
