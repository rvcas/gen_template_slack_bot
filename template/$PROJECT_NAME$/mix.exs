defmodule <%= @project_name_camel_case %>.Mixfile do
  use Mix.Project

  @name :<%= @project_name %>
  @version "0.1.0"

  @deps [
    {:credo, "~> 0.8.6"},
    {:hedwig_slack, "~> 1.0"},
    {:httpoison, "~> 0.13.0"},
    {:poison, "~> 3.1.0"},
    {:quantum, "~> 2.0.0"},
  ]

  def project do
    in_production = Mix.env == :prod

    [
      app: @name,
      version: @version,
      elixir: ">= <%= @elixir_version %>",
      deps: @deps,
      build_embedded: in_production,
    ]
  end

  def application do
    [
      mod: { <%= @project_name_camel_case %>.Application, [] },
      extra_applications: [
        :logger
      ],
    ]
  end

end
