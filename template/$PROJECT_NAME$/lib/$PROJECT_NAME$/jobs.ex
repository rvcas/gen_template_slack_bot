defmodule <%= @project_name_camel_case %>.Jobs do
  alias <%= @project_name_camel_case %>.Jobs.Hello

  def add_jobs do
    hello_job()
  end

  defp hello_job do
    hello_config = Application.get_env(:<%= @project_name %>, Hello)

    if hello_config[:enabled] do
      Quantum.add_job(:hello, %Quantum.Job{
            schedule: hello_config[:schedule],
            task: fn -> Hello.run end
})
    end
  end
end
