# frozen_string_literal: true

module Mobile::Types
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Mobile::Types::BaseArgument
  end
end
