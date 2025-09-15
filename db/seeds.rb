10.times do
  Todo.create(
    title: Faker::Food,
    content: Faker::Mountain
  )
end
