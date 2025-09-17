# frozen_string_literal: true

module Mobile::Types
  module NodeType
    include Mobile::Types::BaseInterface
    # Add the `id` field
    include GraphQL::Types::Relay::NodeBehaviors
  end
end
