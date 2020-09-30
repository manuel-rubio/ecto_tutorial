alias EctoTutorial.{
  Customer,
  Department,
  Employee,
  Insurance,
  Repo,
  Task,
  TaskEmployee
}

Repo.delete_all(TaskEmployee)
Repo.delete_all(Task)
Repo.delete_all(Insurance)
Repo.delete_all(Employee)
Repo.delete_all(Department)
Repo.delete_all(Customer)

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
      phone: "+44 123123123",
      email: "francesco.cesarini@erlang-solutions.com",
      preferred_contact: "phone",
      inserted_at: now,
      updated_at: now
    ],
    [
      first_name: "Robert",
      last_name: "Virding",
      phone: "+46 123123123",
      preferred_contact: "phone",
      inserted_at: now,
      updated_at: now
    ]
  ]
)

{3, [
  %Department{id: hr_id},
  %Department{id: sales_id},
  %Department{id: _tech_id}
]} = Repo.insert_all(
  Department,
  [
    [
      name: "Human Resources",
      inserted_at: now,
      updated_at: now
    ],
    [
      name: "Sales",
      inserted_at: now,
      updated_at: now
    ],
    [
      name: "Tech",
      inserted_at: now,
      updated_at: now
    ]
  ],
  returning: true
)

%Employee{id: james_id} = Repo.insert!(
  %Employee{
    first_name: "James",
    last_name: "Smith",
    phone: "+44 123456789",
    department_id: hr_id,
    salary: 1_000,
    hire_date: ~D[2002-01-01]
  }
)
%Employee{id: john_id} = Repo.insert!(
  %Employee{
    first_name: "John",
    last_name: "Johnson",
    phone: "+44 234567890",
    manager_id: james_id,
    department_id: hr_id,
    salary: 400,
    hire_date: ~D[2005-03-23]
  }
)

{2, [
  %Employee{id: michael_id},
  %Employee{id: johnathan_id}
]} = Repo.insert_all(
  Employee,
  [
    [
      first_name: "Michael",
      last_name: "Williams",
      phone: "+44 135792468",
      manager_id: james_id,
      department_id: sales_id,
      salary: 600,
      hire_date: ~D[2009-05-12],
      inserted_at: now,
      updated_at: now
    ],
    [
      first_name: "Johnathan",
      last_name: "Smith",
      phone: "+44 192837465",
      manager_id: john_id,
      department_id: hr_id,
      salary: 500,
      hire_date: ~D[2016-07-24],
      inserted_at: now,
      updated_at: now
    ]
  ],
  returning: true
)

Repo.insert_all(
  Insurance,
  [
    [
      balance: 1_000,
      employee_id: michael_id,
      inserted_at: now,
      updated_at: now
    ],
    [
      balance: 1_100,
      employee_id: johnathan_id,
      inserted_at: now,
      updated_at: now
    ]
  ]
)
