defmodule ExLaunchDarkly do
  @moduledoc """
  Documentation for ExLaunchDarkly.
  """

  require ExLaunchDarkly.App

  alias ExLaunchDarkly.User

  @type result_value() :: :eld_eval.result_value()

  @spec variation(String.t(), User.t(), result_value()) :: result_value()
  def variation(flag_key, user, default_value), do: :eld.variation(flag_key, user, default_value)

  @spec variation(String.t(), User.t(), result_value(), atom()) :: result_value()
  def variation(flag_key, user, default_value, tag),
    do: :eld.variation(flag_key, user, default_value, tag)

  @spec all_flags_state(User.t()) :: map()
  def all_flags_state(user), do: :eld.all_flags_state(user)

  @spec all_flags_state(User.t(), atom()) :: map()
  def all_flags_state(user, tag), do: :eld.all_flags_state(user, tag)
end
