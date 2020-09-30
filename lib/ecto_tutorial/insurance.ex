defmodule EctoTutorial.Insurance do
  use Ecto.Schema
  import Ecto.Changeset
  alias EctoTutorial.Employee

  schema "insurances" do
    field :balance, :integer
    belongs_to :employee, Employee
    timestamps()
  end

  @required_fields ~w[ balance ]a
  @optional_fields ~w[]a

  @doc false
  def changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
