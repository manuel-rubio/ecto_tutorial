defmodule EctoTutorial.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias EctoTutorial.{Employee, Repo, TaskEmployee}

  schema "tasks" do
    field :name, :string
    field :completed, :boolean, default: false, null: false
    many_to_many :employees, Employee, join_through: TaskEmployee
    timestamps()
  end

  @required_fields ~w[ name ]a
  @optional_fields ~w[ completed ]a

  @doc false
  def changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end

  def assign_employee(task, employee) do
    task = Repo.preload(task, :employees)
    task
    |> change()
    |> put_assoc(:employees, [employee | task.employees])
  end
end
