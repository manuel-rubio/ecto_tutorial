defmodule EctoTutorial.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :phone, :string
    field :preferred_contact, :string
    timestamps()
  end

  @required_fields ~w[
    first_name
    last_name
    preferred_contact
  ]a
  @optional_fields ~w[ phone email ]a

  @doc false
  def changeset(model, params) do
    model
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> validate_format(:phone, ~r/^[0-9 +]+$/)
    |> validate_length(:first_name, min: 3, max: 20)
    |> validate_length(:last_name, min: 5, max: 50)
    |> validate_inclusion(:preferred_contact, ~w[email phone])
  end
end
