defmodule EctoTutorial.Customer do
  use Ecto.Schema

  schema "customers" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :phone, :string
    field :preferred_contact, :string
    timestamps()
  end
end
