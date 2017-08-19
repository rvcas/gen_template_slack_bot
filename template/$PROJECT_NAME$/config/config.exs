use Mix.Config

# configure responders
config :<%= @project_name %>, <%= @project_name_camel_case %>.Robot,
  adapter: Hedwig.Adapters.Slack,
  name: "<%= @project_name %>",
  # aka: "!|<@U4D73B057>",
  token: System.get_env("SLACK_TOKEN") || "not-a-key",
  responders: [
    {<%= @project_name_camel_case %>.Responders.CommitMsg, []},
  ]

# configure jobs
config :<%= @project_name %>, <%= @project_name_camel_case %>.Scheduler,
  timezone: "America/New_York"
  jobs: [
    {"* * * * *", {<%= @project_name_camel_case %>.Jobs.Hello, :run, ["general"]}},
  ]
