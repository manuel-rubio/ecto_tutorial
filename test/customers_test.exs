defmodule EctoTutorial.CustomersTest do
  use ExUnit.Case, async: false
  import EctoTutorial.Factory
  alias EctoTutorial.{Customer, Customers, Repo}

  setup do
    Repo.delete_all(Customer)
    :ok
  end

  describe "get:" do
    test "success" do
      customer = insert(:customer)
      assert customer == Customers.get(customer.id)
    end

    test "not found" do
      assert nil == Customers.get(100)
    end

    test "error" do
      assert %Ecto.Query.CastError{value: :nada} = catch_error(Customers.get(:nada))
    end
  end

  describe "get_by_last_name:" do
    test "success" do
      customer = insert(:customer)
      assert customer == Customers.get_by_last_name(customer.last_name)
    end

    test "not found" do
      assert nil == Customers.get_by_last_name("Garcia")
    end

    test "error" do
      assert %Ecto.Query.CastError{value: :nada} = catch_error(Customers.get_by_last_name(:nada))
    end
  end

  describe "get_all:" do
    test "success" do
      insert_list(4, :customer)
      assert 4 == length([%Customer{} | _] = Customers.get_all())
    end
  end

  describe "insert_by_phone" do
    test "success" do
      assert {:ok, customer = %Customer{
        first_name: "Dennis",
        last_name: "Ritchie",
        phone: "+1 111222333",
        preferred_contact: "phone"
      }} = Customers.insert_by_phone("Dennis", "Ritchie", "+1 111222333")
      assert {:ok, _} = Customers.delete(customer.id)
    end

    test "error" do
      assert %Ecto.ChangeError{} = catch_error(Customers.insert_by_phone("Dennis", "Ritchie", :wrong))
    end
  end

  describe "insert_by_email" do
    test "success" do
      assert {:ok, customer = %Customer{
        first_name: "Dennis",
        last_name: "Ritchie",
        email: "dennis@bell.com",
        preferred_contact: "email"
      }} = Customers.insert_by_email("Dennis", "Ritchie", "dennis@bell.com")
      assert {:ok, _} = Customers.delete(customer.id)
    end

    test "error" do
      assert %Ecto.ChangeError{} = catch_error(Customers.insert_by_email("Dennis", "Ritchie", :wrong))
    end
  end
end
