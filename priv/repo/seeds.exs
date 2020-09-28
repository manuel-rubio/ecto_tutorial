alias EctoTutorial.{Customer, Repo}

now =
  NaiveDateTime.utc_now()
  |> NaiveDateTime.truncate(:second)

Repo.insert_all(
  Customer,
  [
    [
      first_name: "Manuel",
      last_name: "Rubio",
      email: "manuel.rubio@erlang-solutions.com",
      preferred_contact: "email",
      inserted_at: now,
      updated_at: now
    ],
    [
      first_name: "Francesco",
      last_name: "Cesarini",
      phone: "+44.123123123",
      email: "francesco.cesarini@erlang-solutions.com",
      preferred_contact: "phone",
      inserted_at: now,
      updated_at: now
    ],
    [
      first_name: "Robert",
      last_name: "Virding",
      phone: "+46.123123123",
      preferred_contact: "phone",
      inserted_at: now,
      updated_at: now
    ]
  ]
)
