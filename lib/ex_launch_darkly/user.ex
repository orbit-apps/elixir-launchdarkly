defmodule ExLaunchDarkly.User do
  @type t() :: :eld_user.user()

  @spec new(String.t()) :: t()
  def new(key), do: :eld_user.new(key)
end
