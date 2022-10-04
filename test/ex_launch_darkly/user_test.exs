defmodule ExLaunchDarkly.UserTest do
  use ExUnit.Case
  alias ExLaunchDarkly.User

  @raw_user %{key: "test_key", email: "testuser@mail.com"}

  setup do
    user = User.new_from_map(@raw_user)
    [user: user]
  end

  describe "new/1" do
    test "it creates a new user from a key", _setup do
      user = User.new(@raw_user.key)
      assert user == %{key: @raw_user.key}
    end
  end

  describe "get/2" do
    test "it gets an attribute from a user", %{user: user} do
      assert User.get(user, :email) == @raw_user.email
    end
  end

  describe "set/3" do
    test "it sets an attribute on a user", %{user: user} do
      new_email = "newemail@mail.com"

      assert User.set(user, :email, new_email) == %{email: new_email, key: @raw_user.key}
    end
  end

  describe "set_private_attribute_names/2" do
    test "it sets private attribute names", %{user: user} do
      private_attributes = [:first_name, :last_name]
      user_with_private_attributes = User.set_private_attribute_names(user, private_attributes)
      assert user_with_private_attributes.private_attribute_names == private_attributes
    end

    test "it removes private_attributes if an empty list is given", %{user: user} do
      private_attributes = [:first_name, :last_name]
      user_with_private_attributes = User.set_private_attribute_names(user, private_attributes)

      assert user_with_private_attributes.private_attribute_names == private_attributes

      user_without_private_attributes =
        User.set_private_attribute_names(user_with_private_attributes, [])

      assert Map.get(user_without_private_attributes, :private_attribute_names) == nil
    end
  end

  describe "scrub/2" do
    test "it scrubs everything when passed :all", %{user: user} do
      {user, keys} = user |> User.set(:last_name, "Bonk") |> User.scrub(:all)
      assert user == %{key: @raw_user.key}
      assert keys == ["lastName", "email"]
    end

    test "it scrubs specific keys", %{user: user} do
      last_name = "Bonk"
      {user, keys} = user |> User.set(:last_name, last_name) |> User.scrub([:email])
      assert user == %{key: @raw_user.key, last_name: last_name}
      assert keys == ["email"]
    end
  end
end
