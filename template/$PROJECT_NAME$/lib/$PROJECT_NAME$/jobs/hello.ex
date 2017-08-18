defmodule <%= @project_name_camel_case %>.Jobs.Quote do
  @moduledoc false

  use Hedwig.Responder

  import <%= @project_name_camel_case %>.Utils, only: [send_msg: 1, channel_id: 1]

  @conf Application.get_env(:ewq, __MODULE__)

  def run do
    "@channel Hello"
    |> prepare_msg(@conf[:slack_channel])
    |> send_msg
  end

  defp prepare_msg(msg, channel) do
    %Hedwig.Message{
      type: "message",
      room: channel_id(channel),
      text: msg
  end
end
