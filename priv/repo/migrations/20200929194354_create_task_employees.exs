defmodule EctoTutorial.Repo.Migrations.CreateTaskEmployees do
  use Ecto.Migration

  def change do
    create table(:task_employees) do
      add :task_id, references(:tasks)
      add :employee_id, references(:employees)
      timestamps()
    end
  end
end
