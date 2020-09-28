import Config

config :ecto_tutorial,
  ecto_repos: [EctoTutorial.Repo]

import_config "#{Mix.env()}.exs"
