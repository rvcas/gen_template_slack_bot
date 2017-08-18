defmodule <%= @project_name_camel_case %>.Application do
  @moduledoc false

  use Application

  alias <%= @project_name_camel_case %>.{Robot, Cache, Jobs}


  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Robot, []),
      worker(Cache, []),
    ]

    Jobs.add_jobs()

    opts = [
      strategy: :one_for_one,
      name: <%= @project_name_camel_case %>.Supervisor,
    ]

    Supervisor.start_link(children, opts)
  end
end
