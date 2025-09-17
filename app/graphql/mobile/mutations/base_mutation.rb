# frozen_string_literal: true

module Mobile::Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Mobile::Types::BaseArgument
    field_class Mobile::Types::BaseField
    input_object_class Mobile::Types::BaseInputObject
    object_class Mobile::Types::BaseObject
  end
end
