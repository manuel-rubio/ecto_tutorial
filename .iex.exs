alias EctoTutorial.{
  Customer,
  Customers,
  Department,
  Employee,
  Employees,
  Insurance,
  Repo,
  Task,
  TaskEmployee,
  Tasks
}
import Ecto.Query, only: [from: 1, from: 2]

Application.put_env(:elixir, :ansi_enabled, true)

IEx.configure([
  colors: [enabled: true],
  default_prompt: [
    :green, "ecto", :reset, "(", :blue, "%counter", :reset, ")>"
  ] |> IO.ANSI.format() |> IO.chardata_to_string()
])

[
  "\n💾", :green, " Ecto", :reset, " Tutorial\n",
  "(c) 2020", :red, " Erlang", :reset, " Solutions\n"
]
|> IO.ANSI.format()
|> IO.chardata_to_string()
|> IO.puts()

employee1 = %{
  "first_name" => "John",
  "hire_date" => "2020-09-28",
  "last_name" => "Peters",
  "phone" => "+33123123123",
  "salary" => "100000",
  "tasks" => %{
    0 => %{"name" => "write blog post"},
    1 => %{"name" => "test ecto tutorial"}
  },
  "insurance" => %{
    "balance" => "1000"
  }
}

employee2 = %{
  "first_name" => "Ted",
  "hire_date" => "2020-09-28",
  "last_name" => "Johnson",
  "tasks" => %{
    0 => %{"name" => "write blog post"},
    1 => %{"name" => "test ecto tutorial"}
  },
  "insurance" => %{
    "balance" => "1200"
  }
}
