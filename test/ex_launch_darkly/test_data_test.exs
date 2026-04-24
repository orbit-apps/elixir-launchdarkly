defmodule ExLaunchDarkly.TestDataTest do
  use ExUnit.Case, async: false

  setup do
    ExLaunchDarkly.App.start("test", :test_data, ExLaunchDarkly.App.test_options())

    on_exit(fn ->
      ExLaunchDarkly.App.stop_all()
    end)

    :ok
  end

  defp context(key) do
    :ldclient_context.new(key)
  end

  describe "set/3" do
    test "sets a boolean flag for a user" do
      ExLaunchDarkly.TestData.set("bool-flag", true, "user-1")

      assert ExLaunchDarkly.variation("bool-flag", context("user-1"), false, :test_data) == true
    end

    test "sets a string flag for a user" do
      ExLaunchDarkly.TestData.set("string-flag", "basic", "user-1")

      assert ExLaunchDarkly.variation("string-flag", context("user-1"), "default", :test_data) ==
               "basic"
    end

    test "sets an integer flag for a user" do
      ExLaunchDarkly.TestData.set("int-flag", 42, "user-1")

      assert ExLaunchDarkly.variation("int-flag", context("user-1"), 0, :test_data) == 42
    end

    test "sets a map flag for a user" do
      ExLaunchDarkly.TestData.set("map-flag", %{"plan" => "pro"}, "user-1")

      assert ExLaunchDarkly.variation("map-flag", context("user-1"), %{}, :test_data) ==
               %{"plan" => "pro"}
    end
  end

  describe "set_all/2" do
    test "sets a boolean flag for all users" do
      ExLaunchDarkly.TestData.set_all("bool-flag-all", true)

      assert ExLaunchDarkly.variation("bool-flag-all", context("any-user"), false, :test_data) ==
               true
    end

    test "sets a string flag for all users" do
      ExLaunchDarkly.TestData.set_all("string-flag-all", "premium")

      assert ExLaunchDarkly.variation(
               "string-flag-all",
               context("any-user"),
               "default",
               :test_data
             ) == "premium"
    end

    test "sets an integer flag for all users" do
      ExLaunchDarkly.TestData.set_all("int-flag-all", 99)

      assert ExLaunchDarkly.variation("int-flag-all", context("any-user"), 0, :test_data) == 99
    end
  end
end
