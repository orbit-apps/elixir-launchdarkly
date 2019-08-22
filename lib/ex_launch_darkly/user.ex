defmodule ExLaunchDarkly.User do
  @moduledoc """
  User helpers for LaunchDarkly.

  Usage

  ```
  user = User.new("a-slug")
  # => %{key: "a-slug"}

  User.set(user, :email, "user@email.com")
  # => %{key: "a-slug", email: "user@email.com"}
  ```
  """
  @type t() :: :eld_user.user()
  @type attribute() :: :eld_user.attribute()

  @spec new(String.t()) :: t()
  def new(key), do: :eld_user.new(key)

  @spec new_from_map(t()) :: t()
  def new_from_map(user_attributes), do: :eld_user.new_from_map(user_attributes)

  @spec get(t(), attribute()) :: t()
  def get(user, attribute), do: :eld_user.get(attribute, user)

  @spec set(t(), attribute(), any()) :: t()
  def set(user, attribute, value), do: :eld_user.set(attribute, value, user)

  @spec set_private_attribute_names(t(), list(attribute())) :: t()
  def set_private_attribute_names(user, attribute_names),
    do: :eld_user.set_private_attribute_names(attribute_names, user)

  @spec scrub(t(), list(attribute())) :: {t(), list(attribute())}
  def scrub(user, attribute_names), do: :eld_user.scrub(user, attribute_names)
end
