defmodule <%= @project_name_camel_case %>.Utils do
  @moduledoc """
  Credit: @techgaun https://github.com/techgaun/ex_mustang

  Module consisting of all the convenience functions for `<%= @project_name_camel_case %>` to operate
  """

  @doc """
  Send a %Hedwig.Message{} struct through the robot process
  """
  def send_msg(msg) do
    Hedwig.Robot.send(pid(), msg)
  end

  @doc """
  Prepare a %Hedwig.Message struct to pass to send_msg/1
  """
  def prepare_msg(msg, room) do
    %Hedwig.Message{
      type: "message",
      room: channel_id(room),
      text: msg
    }
  end

  @doc """
  Gets the list of channels for Slack from Hedwig.Adapters.Slack process state
  """
  def channels do
    %Hedwig.Robot{adapter: apid} = pid() |> :sys.get_state()
    slack_state = apid
    |> :sys.get_state
    |> Map.from_struct

    slack_state
    |> Map.get(:channels, %{})
    |> Map.merge(Map.get(slack_state, :groups, %{}))
  end

  @doc """
  Gets the channel ID from channel name
  """
  def channel_id(name) do
    {id, _} =
      channels()
      |> Stream.map(fn {_x, %{"id" => id, "name" => name}} -> {id, name} end)
      |> Enum.find({nil, nil}, fn {_, channel} -> channel === name end)
    id
  end

  @doc """
  Parses given domain based on how it comes. If it comes from slack, it is handled properly
  """
  def parse_domain(domain) do
    if String.contains?(domain, "<http") do
      [_ | [domain]] = String.split(domain, "|")
      String.trim_trailing(domain, ">")
    else
      domain
    end
  end

  defp pid, do: :global.whereis_name("<%= @project_name %>")
end
