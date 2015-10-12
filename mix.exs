defmodule Gcmex.Mixfile do
  use Mix.Project

  def project do
    [app: :gcmex,
     version: "0.0.1",
     elixir: "~> 1.1",
     description: "Google Cloud Messaging client library for elixir",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Duke"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/dukex/gcmex"}
    ]
  end

  defp deps do
    [ {:poison, "~> 1.5"},
      {:httpoison, "~> 0.7.2"},
      {:ex_doc, github: "elixir-lang/ex_doc"},
      {:earmark, ">= 0.0.0"}]
  end
end
