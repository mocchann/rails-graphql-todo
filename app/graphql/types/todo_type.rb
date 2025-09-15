# frozen_string_literal: true

module Types
  class TodoType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :content, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :todo_count, Integer, null: false

    def todo_count
      object.todos.size
    end
  end
end
