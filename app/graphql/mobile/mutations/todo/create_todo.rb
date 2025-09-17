module Mobile::Mutations::Todo
  class CreateTodo < Mobile::Mutations::BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true

    field :todo, Mobile::Types::TodoType, null: false
    field :errors, [String], null: false

    def resolve(title:, content:)
      todo = Todo.new(title:, content:)
      if todo.save
        { todo: todo, errors: [] }
      else
        { todo: nil, errors: todo.errors.full_message }
      end
    end
  end
end
