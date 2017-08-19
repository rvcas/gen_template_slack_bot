defmodule <%= @project_name_camel_case %>.Jobs.Hello do
  @moduledoc false

  import <%= @project_name_camel_case %>.Utils,
    only: [send_msg: 1, prepare_msg: 2]

  def run(room, enabled \\ true)
  def run(_room, false), do: nil
  def run(room, true) do
    "@channel Hello"
    |> prepare_msg(room)
    |> send_msg
  end
end
