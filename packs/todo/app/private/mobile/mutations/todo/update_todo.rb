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

      todo = Todo.find_by(id: id, user_id: user_id)
      return { todo: nil, errors: [ "Todo not found" ] } if todo.nil?

      if todo.update(title: title, content: content)
        { todo: todo, errors: [] }
      else
        { todo: nil, errors: todo.errors.full_messages }
      end
    end
  end
end
