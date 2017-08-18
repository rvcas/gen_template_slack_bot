defmodule <%= @project_name_camel_case %>.Responders.CommitMsg do
  @moduledoc """
  Credit: @techguan https://github.com/techgaun/ex_mustang

  Get random commit messages from http://whatthecommit.com/index.txt
  """
  use Hedwig.Responder

  @url "http://whatthecommit.com/index.txt"

  @usage """
  commitmsg - get a random commit message
  """
  hear ~r/^commitmsg$/i, msg do
    reply msg, get_commit_msg()
  end

  defp get_commit_msg do
    case HTTPoison.get(@url, [{"User-Agent", "<%= @project_name_camel_case %>"}]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      _ ->
        "I encountered problem getting a commit message."
    end
  end
end
