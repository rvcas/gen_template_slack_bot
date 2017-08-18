use Mix.Config

# lib configs
config :<%= @project_name %>, <%= @project_name_camel_case %>.Robot,
  adapter: Hedwig.Adapters.Slack,
  name: "<%= @project_name %>",
  # aka: "!|<@U4D73B057>",
  token: System.get_env("SLACK_TOKEN") || "not-a-key",
  responders: [
    {<%= @project_name_camel_case %>.Responders.CommitMsg, []},
  ]

config :quantum,
  timezone: System.get_env("SYSTEM_TIME") || "America/New_York"

# configure jobs
config :ewq, <%= @project_name_camel_case %>.Jobs.Hello,
  schedule: "0 9 * * *",
  slack_channel: "general",
  enabled: true
