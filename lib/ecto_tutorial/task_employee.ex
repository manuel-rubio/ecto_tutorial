defmodule EctoTutorial.TaskEmployee do
  use Ecto.Schema
  alias EctoTutorial.{Employee, Task}

  schema "task_employees" do
    belongs_to :task, Task
    belongs_to :employee, Employee
    timestamps()
  end
end
