defmodule EctoTutorial.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :first_name, :string
      add :last_name, :string
      add :phone, :string
      add :salary, :integer
      add :hire_date, :date
      add :manager_id, references(:employees)
      add :department_id, references(:departments)
      timestamps()
    end
  end
end
