# frozen_string_literal: true

module Mobile::Types
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Mobile::Types::BaseEdge)
    connection_type_class(Mobile::Types::BaseConnection)
    field_class Mobile::Types::BaseField
  end
end
