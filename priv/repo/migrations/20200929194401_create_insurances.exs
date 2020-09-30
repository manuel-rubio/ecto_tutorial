defmodule EctoTutorial.Repo.Migrations.CreateInsurances do
  use Ecto.Migration

  def change do
    create table(:insurances) do
      add :balance, :integer
      add :employee_id, references(:employees)
      timestamps()
    end
  end
end
