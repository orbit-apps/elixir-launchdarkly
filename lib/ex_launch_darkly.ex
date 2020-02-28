defmodule ExLaunchDarkly do
  @moduledoc """
  Documentation for ExLaunchDarkly.
  """

  require ExLaunchDarkly.App

  alias ExLaunchDarkly.User

  @type result_value() :: :ldclient_eval.result_value()

  @spec variation(String.t(), User.t(), result_value()) :: result_value()
  def variation(flag_key, user, default_value),
    do: :ldclient.variation(flag_key, user, default_value)

  @spec variation(String.t(), User.t(), result_value(), atom()) :: result_value()
  def variation(flag_key, user, default_value, tag),
    do: :ldclient.variation(flag_key, user, default_value, tag)

  @spec all_flags_state(User.t()) :: map()
  def all_flags_state(user), do: :ldclient.all_flags_state(user)

  @spec all_flags_state(User.t(), atom()) :: map()
  def all_flags_state(user, tag), do: :ldclient.all_flags_state(user, tag)

  @spec identify(User.t()) :: :ok
  def identify(user), do: :ldclient.identify(user)

  @spec identify(User.t(), atom()) :: :ok
  def identify(user, tag), do: :ldclient.identify(user, tag)
end
