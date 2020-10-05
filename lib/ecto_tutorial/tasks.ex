defmodule EctoTutorial.Tasks do
  import Ecto.Query, only: [from: 2]
  alias EctoTutorial.{
    Employee,
    Repo,
    Task
  }

  def list_busy_employees do
    task_ids = from(t in Task.list_pending(), select: [:id])
    from(
      e in Employee.list(),
      join: t in assoc(e, :tasks),
      where: t.id in subquery(task_ids)
    )
    |> Repo.all()
  end

  @doc """
  Create a task
  """
  def create_task(name) do
    Task.changeset(%Task{}, %{"name" => name})
    |> Repo.insert()
  end

  @doc """
  Remove task
  """
  def delete_task(%Task{} = task) do
    Task.delete(task)
    |> Repo.delete()
  end

  @doc """
  Toggle task as complete/incomplete
  """
  def toggle_task(%Task{completed: completed} = task) do
    task
    |> Task.changeset(%{"completed" => not completed})
    |> Repo.update()
  end

  @doc """
  Search tasks based on name (Hint: use like)
  """
  def search_by_name(name) do
    Task.search_by_name(name)
    |> Repo.all()
  end

  @doc """
  Retrieve all the tasks given the employee ID
  """
  def list_by_employee_id(employee_id) do
    Task.list_by_employee_id(employee_id)
    |> Repo.all()
  end

  @doc """
  Retrieve a list of: employee_id, count of completed tasks,
  and count of uncompleted tasks (Hint: use select).
  """
  def get_stats do
    {:error, :noimpl}
    Task.get_stats()
    |> Repo.all()
  end
end
