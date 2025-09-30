# frozen_string_literal: true

module Mobile::Mutations::Todo
  class DeleteTodo < Mobile::Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :user_id, ID, required: true

    field :todo, Mobile::Types::TodoType, null: true
    field :errors, [ String ], null: false

    def resolve(id:, user_id:)
      # return { todo: nil, errors: [ "You must be signed in to delete a todo" ] } unless context[:current_user]

      todo = TodoService.find_todo_by_user_and_id(id: id, user_id: user_id)
      return { todo: nil, errors: [ "Todo not found" ] } if todo.nil?

      TodoService.destroy_todo(todo)
      { todo: todo, errors: [] }
    rescue ActiveRecord::RecordNotDestroyed => e
      { todo: nil, errors: e.record.errors.full_messages }
    end
  end
end
