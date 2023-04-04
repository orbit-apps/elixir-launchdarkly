defmodule ExLaunchDarkly.Context do
  @moduledoc """
  Context helpers for LaunchDarkly.
  """
  @type t() :: :ldclient_context.context()
  @type attribute() :: :ldclient_context.attribute_value()

  @spec new(String.t()) :: t()
  def new(key), do: :ldclient_context.new(key)

  @spec new_from_map(map()) :: t()
  def new_from_map(attributes), do: :ldclient_context.new_from_map(attributes)

  @spec is_valid?(t(), boolean()) :: boolean()
  def is_valid?(context, allow_empty_keys),
    do: :ldclient_context.is_valid(context, allow_empty_keys)
end
