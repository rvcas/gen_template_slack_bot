# Slack Bot Template

A mix gen template for quickly bootstrapping slack bots
in elixir. If you have made bot user and have a token already then
this will run out of box as long as the token in set to the proper
environment variable.

## Quick Start

This only works if you have a bot/token ready and
are familiar with [mix templates](https://player.vimeo.com/video/213689412).
Otherwise, skip this and please read on.

```
$ export SLACK_TOKEN=sOmeTOkendcnked-ewjnc
$ mix template.install gen_template_slack_bot
$ mix gen slack_bot «project_name»
$ cd «project_name»
$ mix deps.get
$ mix run --no-halt
```

## New Project Template

```
mix gen slack_bot «name» [ --into «path» ] [--app[lication] «app»] [--module «module»]
```

## Installation

This template is installed using the `template.install` mix task.
Projects are generated from it using the `mix gen` task.

So, before using templates for the first time, you need to install these two tasks:

```
$ mix archive.install mix_templates
$ mix archive.install mix_generator
```

Then you can install this template using

```
$ mix template.install gen_template_slack_bot
```

## Use

To create a new project run:

```
$ mix gen slack_bot «project_name»
```

To run this you will need a token from Slack in
set to an environment variable:

```
$ cd «project_name»
$ mix deps.get
$ mix run --no-halt
```

`«project_name»` is both the name of the subdirectory that will hold the
project and the name that will be given to the application. This
affects entries in `mix.exs` as well as the names of the main
file in `lib/` and the skeleton test in `test/`. The application
module name will be the camelcase version of «name».

By default the subdirectory will be created under your
current directory; you can change this with the `--into` option:

```
$ mix gen slack_bot «project_name» --into some/other/dir
```

### Variants

**NOTE** *Have not tested with these yet*

The application's `start` function is created in
`lib/«name»/application.ex`, along with a basic supervisor.

You can change the name used for the application:

```
$ mix gen slack_bot «project_name» --app[lication] «app»
```

The original «project_name» parameter will be the
name used for the directory, and «app» will be used when
creating file names in that directory and when customizing the
file contents.

Finally, you can override the name used for the application module:

```
$ mix gen slack_bot «project_name» --module «Module»
```

«Module» must be a valid Elixir module name or alias.

## More Info On `mix gen`

You can [watch a video of Dave Thomas](https://player.vimeo.com/video/213689412)
explaining the new generator project, and how to use it.

You can also look at his projects related to project generation.

* https://github.com/pragdave/mix_templates
* https://github.com/pragdave/gen_template_template
* https://github.com/pragdave/gen_template_project
