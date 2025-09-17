# frozen_string_literal: true

module Mobile::Types
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class(Mobile::Types::BaseEdge)
    connection_type_class(Mobile::Types::BaseConnection)
  end
end
