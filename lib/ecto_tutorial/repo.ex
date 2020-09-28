defmodule EctoTutorial.Repo do
  use Ecto.Repo,
    otp_app: :ecto_tutorial,
    adapter: Ecto.Adapters.Postgres

  @doc """
  Dynamically loads the repository URL from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
