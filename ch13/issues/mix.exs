defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      escript: escript_config,
      version: "0.1.0",
      elixir: "~> 1.9",
      source_url: "https://github.com/bleach31/programming_elixir_1.2ja/tree/master/ch13/issues",
      build_embedded:  Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [ applications: [ :logger, :httpoison ] ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:poison, "1.5.2"},
      {:ex_doc, "~> 0.21.3"},
      {:earmark, "~> 1.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
  
  defp escript_config do
    [ main_module: Issues.CLI ]
  end
end
