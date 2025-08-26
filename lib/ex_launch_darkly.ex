defmodule ExLaunchDarkly do
  @moduledoc """
  Documentation for ExLaunchDarkly.
  """

  alias ExLaunchDarkly.Context
  alias ExLaunchDarkly.User

  require ExLaunchDarkly.App

  @type result_value() :: :ldclient_eval.result_value()

  @spec variation(String.t(), Context.t(), result_value()) :: result_value()
  @spec variation(String.t(), User.t(), result_value()) :: result_value()
  def variation(flag_key, input, default_value) when is_binary(flag_key),
    do: :ldclient.variation(flag_key, input, default_value)

  @spec variation(String.t(), Context.t(), result_value(), atom()) :: result_value()
  @spec variation(String.t(), User.t(), result_value(), atom()) :: result_value()
  def variation(flag_key, input, default_value, tag) when is_binary(flag_key) and is_atom(tag),
    do: :ldclient.variation(flag_key, input, default_value, tag)

  @spec all_flags_state(Context.t()) :: map()
  @spec all_flags_state(User.t()) :: map()
  def all_flags_state(input), do: :ldclient.all_flags_state(input)

  @spec all_flags_state(Context.t(), atom()) :: map()
  @spec all_flags_state(User.t(), atom()) :: map()
  def all_flags_state(input, tag) when is_atom(tag), do: :ldclient.all_flags_state(input, tag)

  @spec identify(Context.t()) :: :ok
  @spec identify(User.t()) :: :ok
  def identify(input), do: :ldclient.identify(input)

  @spec identify(Context.t(), atom()) :: :ok
  @spec identify(User.t(), atom()) :: :ok
  def identify(input, tag), do: :ldclient.identify(input, tag)
end
