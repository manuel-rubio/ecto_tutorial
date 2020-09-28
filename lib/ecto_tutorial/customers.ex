defmodule EctoTutorial.Customers do
  alias EctoTutorial.{Customer, Repo}

  @doc """
  Retrieve a customer based on the provided ID.
  """
  def get(id) do
    {:error, :noimpl}
  end

  @doc """
  Retrieve a customer based on the provided last name.
  """
  def get_by_last_name(last_name) do
    {:error, :noimpl}
  end

  @doc """
  Retrieve all of the customers.
  """
  def get_all() do
    {:error, :noimpl}
  end

  @doc """
  Insert a customer providing first name, last name and phone.
  Set the preferred contact field accordingly. Returns an
  ok-tuple with the inserted structure for the customer.
  """
  def insert_by_phone(first_name, last_name, phone) do
    {:error, :noimpl}
  end

  @doc """
  Insert a customer providing first name, last name and email.
  Set the preferred contact field accordingly. Returns an
  ok-tuple with the inserted structure for the customer.
  """
  def insert_by_email(first_name, last_name, email) do
    {:error, :noimpl}
  end

  @doc """
  Remove a customer given its ID. Returns an ok-tuple with the
  removed entry or an error-tuple.
  """
  def delete(id) do
    {:error, :noimpl}
  end
end
