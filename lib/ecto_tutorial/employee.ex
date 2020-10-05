defmodule EctoTutorial.Employee do
  use Ecto.Schema
  import Ecto.Query, only: [from: 2]
  import Ecto.Changeset
  alias EctoTutorial.{
    Department,
    Employee,
    Insurance,
    Repo,
    Task,
    TaskEmployee
  }

  schema "employees" do
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :salary, :integer
    field :hire_date, :date
    belongs_to :department, Department, on_replace: :nilify
    belongs_to :manager, Employee, foreign_key: :manager_id
    has_many :subordinates, Employee, foreign_key: :manager_id
    many_to_many :tasks, Task, join_through: TaskEmployee
    has_one :insurance, Insurance
    timestamps()
  end

  @required_fields ~w[
    first_name
    last_name
  ]a
  @optional_fields ~w[
    salary
    hire_date
    phone
  ]a

  @doc false
  def changeset(model, params) do
    manager =
      if manager_id = params["manager_id"] do
        Repo.get(Employee, manager_id)
      end

    model
    |> Repo.preload([:manager])
    |> cast(params, @required_fields ++ @optional_fields)
    |> cast_assoc(:insurance)
    |> cast_assoc(:tasks)
    |> put_assoc(:manager, manager)
    |> validate_required(@required_fields)
  end

  def assign_department(employee, department) do
    employee
    |> Repo.preload(:department)
    |> change()
    |> put_assoc(:department, department)
  end

  def assign_task(employee, task) do
    employee = Repo.preload(employee, :tasks)
    employee
    |> change()
    |> put_assoc(:tasks, [task | employee.tasks])
  end

  def list(query \\ Employee) do
    from(e in query, order_by: [:hire_date])
  end

  def count_by_department(query \\ Employee) do
    from(
      e in query,
      join: d in assoc(e, :department),
      group_by: d.id,
      select: [count(e.id), d.name])
  end
end
