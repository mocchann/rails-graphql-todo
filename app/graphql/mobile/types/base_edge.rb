# frozen_string_literal: true

module Mobile::Types
  class BaseEdge < Mobile::Types::BaseObject
    # add `node` and `cursor` fields, as well as `node_type(...)` override
    include GraphQL::Types::Relay::EdgeBehaviors
  end
end
