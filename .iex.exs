alias EctoTutorial.{Customer, Customers, Repo}

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
