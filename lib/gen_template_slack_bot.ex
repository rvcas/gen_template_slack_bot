defmodule GenTemplateSlackBot do

  @moduledoc File.read!(Path.join([__DIR__, "../README.md"]))
  
  use MixTemplates,
    name:       :gen_template_slack_bot,
    short_desc: "Template for ....",
    source_dir: "../template"

  
end
