# frozen_string_literal: true

module Mobile::Types
  class TodoType < Mobile::Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :content, String
    field :user, Mobile::Types::UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
