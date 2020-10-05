# test/support/factory.ex
defmodule EctoTutorial.Factory do
  use ExMachina.Ecto, repo: EctoTutorial.Repo

  alias EctoTutorial.{Customer, Department, Employee, Insurance}

  defp utc_now, do: Map.put(NaiveDateTime.utc_now(), :microsecond, {0, 0})

  defp get_datetime(x) do
    NaiveDateTime.add(utc_now(), x * (x * 10 - 365) * 3_600 * 24, :second)
  end

  def customer_factory(attrs) do
    customer =
      %Customer{
        first_name: sequence(:first_name, ["John", "Paul", "George", "Ringo"]),
        last_name: sequence(:last_name, ["Starr", "Harrison", "McCartney", "Lennon"]),
        email: sequence(:email, &"beat#{&1}@music.com"),
        phone: sequence(:phone, &"+44 #{rem(123_456_221 * &1, 1_000_000_000)}"),
        preferred_contact: sequence(:contact, [:phone, :email])
      }

    merge_attributes(customer, attrs)
  end

  def employee_factory(attrs) do
    department = Map.get_lazy(attrs, :department, fn -> insert(:department) end)
    insurance = Map.get_lazy(attrs, :insurance, fn -> insert(:insurance) end)
    employee =
      %Employee{
        first_name: sequence(:first_name, ["Rod", "Ritchie", "Nick", "Jon"]),
        last_name: sequence(:last_name, ["Lord", "Simper", "Blackmore", "Evans"]),
        phone: sequence(:phone, &"+44 #{rem(321_567_987 * (&1 + 1), 1_000_000_000)}"),
        salary: sequence(:salary, &(rem(250 * &1, 1_500) + 500)),
        hire_date: sequence(:hire_date, fn x -> get_datetime(x) end),
        department: department,
        insurance: insurance
      }

    merge_attributes(employee, attrs)
  end

  def insurance_factory do
    %Insurance{
      balance: sequence(:salary, &(Money.new(rem(250 * &1, 1_500) + 500))),
    }
  end

  def department_factory do
    %Department{
      name: sequence(:name, ["Tech", "Marketing", "Sales", "Admin"])
    }
  end
end
