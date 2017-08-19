defmodule <%= @project_name_camel_case %>.Application do
  @moduledoc false

  use Application

  alias <%= @project_name_camel_case %>.{Cache, Robot, Scheduler}


  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Cache, []),
      worker(Robot, []),
      worker(Scheduler, []),
    ]

    opts = [
      strategy: :one_for_one,
      name: <%= @project_name_camel_case %>.Supervisor,
    ]

    Supervisor.start_link(children, opts)
  end
end
