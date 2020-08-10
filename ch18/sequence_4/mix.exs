defmodule Sequence.MixProject do
  use Mix.Project

  def project do
    [
      app: :sequence,
      version: "0.2.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == [:prod, :step, :tar],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Sequence.Application, []},
      env: [initial_number: 456], # = [{:inital_number,456}]
      #mod: { Sequence, 456 },
      registered: [ Sequence.Server ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 1.5", runtime: false},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
