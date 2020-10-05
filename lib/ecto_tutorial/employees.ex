defmodule EctoTutorial.Employees do
  alias EctoTutorial.{
    Department,
    Employee,
    Repo,
    Task
  }

  @doc """
  Create employee with insurance information (balance).
  """
  def create_employee(first_name, last_name, insurance_balance) do
    params = %{
      first_name: first_name,
      last_name: last_name,
      insurance: %{balance: insurance_balance}
    }

    %Employee{}
    |> Employee.changeset(params)
    |> Repo.insert()
  end

  @doc """
  Update employee data
  """
  def update_employee(id, fname, lname, phone, salary, hire_date) do
    case Repo.get(Employee, id) do
      %Employee{} = employee ->
        params = %{
          first_name: fname,
          last_name: lname,
          phone: phone,
          salary: salary,
          hire_date: hire_date
        }
        Employee.changeset(employee, params)
        |> Repo.update()
      nil ->
        {:error, :notfound}
    end
  end

  @doc """
  Create a task assigned to an employee
  """
  def create_task(name, employee) do
    Task.changeset(%Task{}, %{"name" => name})
    |> Task.assign_employee(employee)
    |> Repo.insert!()
  end

  @doc """
  Assign an existing employee to a department
  """
  def assign_employee_to_department(%Employee{} = employee, %Department{} = department) do
    Employee.assign_department(employee, department)
    |> Repo.update()
  end

  @doc """
  Assign an existing employee to a task
  """
  def assign_employee_to_task(employee, task) do
    Employee.assign_task(employee, task)
    |> Repo.update()
  end
end
