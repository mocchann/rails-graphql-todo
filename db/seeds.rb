# テストユーザーを作成
user = User.create!(
  username: "testuser",
  email: "testuser@example.com",
  password: "password",
  password_confirmation: "password"
)

# ユーザーに関連するTodoを作成
10.times do
  Todo.create!(
    title: Faker::Food.ingredient,
    content: Faker::Mountain.name,
    user: user
  )
end
