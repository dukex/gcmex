defmodule Gcmex.Mixfile do
  use Mix.Project

  def project do
    [app: :gcmex,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [ {:poison, "~> 1.5"},
      {:httpoison, "~> 0.7.2"}]
  end
end
