import Config

config :ecto_tutorial,
  ecto_repos: [EctoTutorial.Repo]

config :money,
  default_currency: "EUR",
  separator: ".",
  delimiter: ",",
  symbol: true,
  symbol_on_right: true,
  symbol_space: true,
  fractional_unit: true

import_config "#{Mix.env()}.exs"
