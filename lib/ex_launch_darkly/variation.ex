defmodule ExLaunchDarkly.Variation do
  @type value() :: :ldclient_flag.variation_value()
  @type key() :: :ldclient_flag.key()

  defguard is_variation_key(key) when is_binary(key)

  defguard is_variation_value(value)
           when is_boolean(value) or is_integer(value) or
                  is_float(value) or is_binary(value) or
                  is_list(value) or is_map(value)
end
