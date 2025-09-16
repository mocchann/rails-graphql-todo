module Mutation
  class Mutations::Todo::DeleteTodo < Mutations::BaseMutation
    argument :id, Integer, required: true

    field :todo, Types::TodoType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      todo = Todo.find_by(id: id)
      return { todo: nil, errors: ['Todo not found'] } if todo.nil?

      todo.destroy
      return { todo: todo, errors: [] } if todo.destroyed?

      { todo: nil, errors: todo.errors.full_messages }
    end
  end
end
