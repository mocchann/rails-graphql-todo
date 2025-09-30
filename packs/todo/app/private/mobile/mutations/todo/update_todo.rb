# frozen_string_literal: true

module Mobile::Mutations::Todo
  class UpdateTodo < Mobile::Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :title, String, required: true
    argument :content, String, required: true
    argument :user_id, ID, required: true

    field :todo, Mobile::Types::TodoType, null: false
    field :errors, [ String ], null: false

    def resolve(id:, title:, content:, user_id:)
      # return { todo: nil, errors: [ "You must be signed in to update a todo" ] } unless context[:current_user]

      todo = TodoService.find_todo_by_user_and_id(id: id, user_id: user_id)
      return { todo: nil, errors: [ "Todo not found" ] } if todo.nil?

      TodoService.update_todo_with_params(
        todo: todo,
        title: title,
        content: content
      )
      { todo: todo, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { todo: nil, errors: e.record.errors.full_messages }
    end
  end
end
