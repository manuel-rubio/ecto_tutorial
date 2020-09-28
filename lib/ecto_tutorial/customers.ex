defmodule EctoTutorial.Customers do
  alias EctoTutorial.{Customer, Repo}

  @doc """
  Retrieve a customer based on the provided ID.
  """
  def get(id) do
    Repo.get(Customer, id)
  end

  @doc """
  Retrieve a customer based on the provided last name.
  """
  def get_by_last_name(last_name) do
    Repo.get_by(Customer, last_name: last_name)
  end

  @doc """
  Retrieve all of the customers.
  """
  def get_all() do
    Repo.all(Customer)
  end

  @doc """
  Insert a customer providing first name, last name and phone.
  Set the preferred contact field accordingly. Returns an
  ok-tuple with the inserted structure for the customer.
  """
  def insert_by_phone(first_name, last_name, phone) do
    Repo.insert(%Customer{
      first_name: first_name,
      last_name: last_name,
      phone: phone,
      preferred_contact: "phone"
    })
  end

  @doc """
  Insert a customer providing first name, last name and email.
  Set the preferred contact field accordingly. Returns an
  ok-tuple with the inserted structure for the customer.
  """
  def insert_by_email(first_name, last_name, email) do
    Repo.insert(%Customer{
      first_name: first_name,
      last_name: last_name,
      email: email,
      preferred_contact: "email"
    })
  end

  @doc """
  Update the first name and last name for a customer given its ID.
  It should return the Customer struct in an ok-tuple or an error.
  """
  def update(id, first_name, last_name) do
    {:error, :noimpl}
  end

  @doc """
  Remove a customer given its ID. Returns an ok-tuple with the
  removed entry or an error-tuple.
  """
  def delete(id) do
    case get(id) do
      %Customer{} = customer -> Repo.delete(customer)
      nil -> {:error, :notfound}
    end
  end
end
