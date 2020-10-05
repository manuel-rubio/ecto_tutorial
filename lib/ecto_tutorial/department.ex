defmodule EctoTutorial.Department do
  use TypedEctoSchema
  alias EctoTutorial.Employee

  # NOT NEEDED WITH :typed_ecto_schema
  # @type t() :: %__MODULE__{
  #   id: pos_integer(),
  #   name: String.t(),
  #   employees: [Employee.t()],
  #   updated_at: NaiveDateTime.t(),
  #   inserted_at: NaiveDateTime.t()
  # }

  typed_schema "departments" do
    field :name, :string
    has_many :employees, Employee
    timestamps()
  end
end
