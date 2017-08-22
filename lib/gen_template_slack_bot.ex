defmodule GenTemplateSlackBot do
  @moduledoc File.read!(Path.join([__DIR__, "../README.md"]))

  use MixTemplates,
    name:       :slack_bot,
    short_desc: "Generates a Slack bot boilerplate that works out of the box and is easily extensible",
    source_dir: "../template",
    options:    [
      app: [
        to:       :app,
        required: false,
        takes:    "app_name",
        desc:     "sets the application name to «app_name»"
      ],
      application: [ same_as: :app ],

      module: [
        to:        :project_name_camel_case,
        required:  false,
        takes:     "«project_name»",
        desc:      "sets the name of the module to «project_name»"
      ]
    ]
end
