defmodule EctoTutorial.Insurance do
  use Ecto.Schema
  import Ecto.Changeset
  alias EctoTutorial.Employee

  schema "insurances" do
    field :balance, Money.Ecto.Amount.Type, default: Money.new(0)
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
