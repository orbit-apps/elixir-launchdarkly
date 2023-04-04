defmodule ExLaunchDarkly do
  @moduledoc """
  Documentation for ExLaunchDarkly.
  """

  alias ExLaunchDarkly.Context
  alias ExLaunchDarkly.User

  require ExLaunchDarkly.App

  @type result_value() :: :ldclient_eval.result_value()

  @spec variation(String.t(), User.t() | Context.t(), result_value()) :: result_value()
  def variation(flag_key, input, default_value),
    do: :ldclient.variation(flag_key, input, default_value)

  @spec variation(String.t(), User.t() | Context, result_value(), atom()) :: result_value()
  def variation(flag_key, input, default_value, tag),
    do: :ldclient.variation(flag_key, input, default_value, tag)

  @spec all_flags_state(User.t() | Context.t()) :: map()
  def all_flags_state(input), do: :ldclient.all_flags_state(input)

  @spec all_flags_state(User.t() | Context.t(), atom()) :: map()
  def all_flags_state(input, tag), do: :ldclient.all_flags_state(input, tag)

  @spec identify(User.t() | Context.t()) :: :ok
  def identify(input), do: :ldclient.identify(input)

  @spec identify(User.t() | Context.t(), atom()) :: :ok
  def identify(input, tag), do: :ldclient.identify(input, tag)
end
