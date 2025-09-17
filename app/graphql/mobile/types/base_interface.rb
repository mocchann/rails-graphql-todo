# frozen_string_literal: true

module Mobile::Types
  module BaseInterface
    include GraphQL::Schema::Interface
    edge_type_class(Mobile::Types::BaseEdge)
    connection_type_class(Mobile::Types::BaseConnection)

    field_class Mobile::Types::BaseField
  end
end
