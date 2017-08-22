defmodule GenTemplateSlackBot.Mixfile do
  use Mix.Project

  @name    :gen_template_slack_bot
  @version "0.1.0"

  @deps [
    { :mix_templates,  ">0.0.0",  app: false },
    { :ex_doc,         ">0.0.0",  only: [:dev, :test] },
  ]

  @maintainers ["Lucas Rosa <lucas@barnonesystems.com>"]
  @github      "https://github.com/lrosa007/#{@name}"

  @description """
  Generates a Slack bot boilerplate that works out
  of the box and is easily extensible.

  Support for cron-like jobs and commands included.
  """

  def project do
    in_production = Mix.env == :prod
    [
      app:     @name,
      version: @version,
      deps:    @deps,
      elixir:  "~> 1.4",
      package: package(),
      description:     @description,
      build_embedded:  in_production,
      start_permanent: in_production,
    ]
  end

  defp package do
    [
      name:        @name,
      files:       ["lib", "mix.exs", "README.md", "LICENSE.md", "template"],
      maintainers: @maintainers,
      licenses:    ["Apache 2.0"],
      links:       %{
        "GitHub" => @github,
      },
      #     extra:       %{ "type" => "a_template_for_mix_gen" },
    ]
  end

end
