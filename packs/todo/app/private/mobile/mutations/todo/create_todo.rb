# frozen_string_literal: true

module Mobile::Mutations::Todo
  class CreateTodo < Mobile::Mutations::BaseMutation
    argument :title, String, required: true
    argument :content, String, required: true
    argument :userId, ID, required: true

    field :todo, Mobile::Types::TodoType, null: true
    field :errors, [ String ], null: false

    def resolve(title:, content:, userId:)
      # return { todo: nil, errors: [ "You must be signed in to create a todo" ] } unless context[:current_user]

      user = AuthService.find_user(userId)
      todo = TodoService.create_todo_with_user(
        title: title,
        content: content,
        user: user
      )
      { todo: todo, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { todo: nil, errors: e.record.errors.full_messages }
    end
  end
end
