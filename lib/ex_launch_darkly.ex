defmodule ExLaunchDarkly do
  @moduledoc """
  Documentation for ExLaunchDarkly.
  """

  import ExLaunchDarkly.App

  alias ExLaunchDarkly.User

  @type result_value() :: :eld_eval.result_value()

  @spec variation(String.t(), User.t(), result_value()) :: result_value()
  def variation(flag_key, user, default_value), do: :eld.variation(flag_key, user, default_value)

  @spec variation(String.t(), User.t(), result_value(), atom()) :: result_value()
  def variation(flag_key, user, default_value, tag),
    do: :eld.variation(flag_key, user, default_value, tag)
end
