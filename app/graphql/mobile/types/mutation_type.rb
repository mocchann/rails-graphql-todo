# frozen_string_literal: true

module Mobile::Types
  class MutationType < Mobile::Types::BaseObject
    field :create_todo, mutation: Mobile::Mutations::Todo::CreateTodo
    field :update_todo, mutation: Mobile::Mutations::Todo::UpdateTodo
    field :delete_todo, mutation: Mobile::Mutations::Todo::DeleteTodo
  end
end
