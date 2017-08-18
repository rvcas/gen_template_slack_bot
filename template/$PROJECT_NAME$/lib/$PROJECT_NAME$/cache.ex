defmodule <%= @project_name_camel_case %>.Cache do
  @moduledoc false

  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :cache)
  end

  def init(_) do

    {:ok, %{}}
  end
end
