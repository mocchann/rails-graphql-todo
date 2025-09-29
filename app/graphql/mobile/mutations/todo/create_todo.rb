module Mobile::Mutations::Todo
  class CreateTodo < Mobile::Mutations::BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    argument :userId, ID, required: true

    field :todo, Mobile::Types::TodoType, null: true
    field :errors, [ String ], null: false

    def resolve(title:, content:, userId:)
      # return { todo: nil, errors: [ "You must be signed in to create a todo" ] } unless context[:current_user]

      # todo = Todo.new(title:, content:, user: context[:current_user])
      todo = Todo.new(title:, content:, user: User.find(userId))
      if todo.save
        { todo: todo, errors: [] }
      else
        { todo: nil, errors: todo.errors.full_messages }
      end
    end
  end
end
