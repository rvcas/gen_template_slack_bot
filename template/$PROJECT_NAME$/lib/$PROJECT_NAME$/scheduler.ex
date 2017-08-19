defmodule <%= @project_name_camel_case %>.Scheduler do
  use Quantum.Scheduler,
    otp_app: :<%= @project_name %>
end
