User.delete_all

User.create!(
  [
    {
      email: "example@test.com",
      name: "テストユーザー",
      password: "passpasspass",
      password_confirmation: "passpasspass",
    },
  ]
)