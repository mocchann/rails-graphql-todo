module Mobile::Mutations::Todo
  class CreateTodo < Mobile::Mutations::BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true

    field :todo, Mobile::Types::TodoType, null: false
    field :errors, [ String ], null: false

    def resolve(title:, content:)
      return { todo: nil, errors: [ "You must be signed in to create a todo" ] } unless context[:current_user]

      todo = Todo.new(title:, content:, user: context[:current_user])
      if todo.save
        { todo: todo, errors: [] }
      else
        { todo: nil, errors: todo.errors.full_messages }
      end
    end
  end
end
