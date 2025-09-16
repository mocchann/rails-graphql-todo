# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_todo, mutation: Mutations::Todo::CreateTodo
    field :update_todo, mutation: Mutations::Todo::UpdateTodo
    field :delete_todo, mutation: Mutations::Todo::DeleteTodo
  end
end
