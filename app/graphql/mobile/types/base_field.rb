# frozen_string_literal: true

module Mobile::Types
  class BaseField < GraphQL::Schema::Field
    argument_class Mobile::Types::BaseArgument
  end
end
