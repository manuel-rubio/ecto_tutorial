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
    {:error, :noimpl}
  end

  @doc """
  Update employee data
  """
  def update_employee(id, fname, lname, phone, salary, hire_date) do
    {:error, :noimpl}
  end

  @doc """
  Create a task assigned to an employee
  """
  def create_task(name, employee) do
    {:error, :noimpl}
  end

  @doc """
  Assign an existing employee to a department
  """
  def assign_employee_to_department(%Employee{} = employee, %Department{} = department) do
    {:error, :noimpl}
  end

  @doc """
  Assign an existing employee to a task
  """
  def assign_employee_to_task(employee, task) do
    {:error, :noimpl}
  end
end
