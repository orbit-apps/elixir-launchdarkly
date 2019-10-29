defmodule ExLaunchDarkly.MixProject do
  use Mix.Project

  @version "0.0.4"

  def project do
    [
      app: :ex_launch_darkly,
      version: @version,
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Dev and Test
      {:credo, "~> 1.1.0", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0.0-rc.4", only: :dev, runtime: false},
      # Everything else
      {:eld, github: "launchdarkly/erlang-server-sdk", tag: "1.0.0-alpha3"}
    ]
  end
end
