defmodule EctoTutorial.Task do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias EctoTutorial.{Employee, Repo, Task, TaskEmployee}

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

  def assign_employee(%Task{} = task, employee) do
    task = Repo.preload(task, :employees)
    task
    |> change()
    |> put_assoc(:employees, [employee | task.employees])
  end

  def assign_employee(%Ecto.Changeset{} = task, employee) do
    employees = get_field(task, :employees)
    put_assoc(task, :employees, [employee | employees])
  end

  def list_pending(query \\ Task) do
    from(t in query, where: not t.completed)
  end
end
