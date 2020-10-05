import Config

config :ecto_tutorial, EctoTutorial.Repo,
  username: "postgres",
  password: "postgres",
  database: "ecto_tutorial_test",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox
