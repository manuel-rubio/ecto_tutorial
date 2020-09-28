import Config

config :ecto_tutorial, EctoTutorial.Repo,
  username: "postgres",
  password: "postgres",
  database: "ecto_tutorial",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
