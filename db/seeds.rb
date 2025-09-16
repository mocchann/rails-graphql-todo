10.times do
  Todo.create(
    title: Faker::Food.ingredient,
    content: Faker::Mountain.name
  )
end
