defmodule EctoTutorial.Department do
  use Ecto.Schema
  alias EctoTutorial.Employee

  schema "departments" do
    field :name, :string
    has_many :employees, Employee
    timestamps()
  end
end
