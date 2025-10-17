defmodule ExLaunchDarkly.TestData do
  @moduledoc """
  This provides some wrappers around the LaunchDarkly Erlang :ldclient_flagbuilder and :ldclient_testdata modules.

  ## To Use

  Add the following to your exunit test helper:
  ```elixir
  ExLaunchDarkly.App.start("test", :sometag, ExLaunchDarkly.App.test_options())
  or
  ExLaunchDarkly.App.start("test", ExLaunchDarkly.App.test_options())
  ```

  Add some flag set calls to your test file.

  For an individual user:
  ```elixir
  ExLaunchDarkly.TestData.set("feature-foo-bar", true, "someUser")
  ```

  For all users:
  ```elixir
  ExLaunchDarkly.TestData.set("feature-fizz-buzz", true, "someUser")
  ```
  """
  import ExLaunchDarkly.Variation, only: [is_variation_value: 1]
  alias ExLaunchDarkly.Variation

  @spec set(String.t(), Variation.value(), String.t()) :: :ok
  def set(flag, value, user)
      when is_binary(flag) and is_binary(user) and is_variation_value(value) do
    {:ok, ld_flag} = :ldclient_testdata.flag(flag)
    user_variation = :ldclient_flagbuilder.variation_for_context(value, "user", user, ld_flag)
    ld_flag = :ldclient_flagbuilder.fallthrough_variation(false, user_variation)
    :ldclient_testdata.update(ld_flag)
  end

  @spec set_all(String.t(), Variation.value()) :: :ok
  def set_all(flag, value) when is_binary(flag) and is_variation_value(value) do
    {:ok, ld_flag} = :ldclient_testdata.flag(flag)

    value
    |> :ldclient_flagbuilder.variation_for_all(ld_flag)
    |> :ldclient_testdata.update()
  end
end
