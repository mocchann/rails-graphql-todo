# frozen_string_literal: true

module Mobile::Types
  class SignIn < Mobile::Types::BaseInputObject
    argument :email, String, required: true
    argument :password, String, required: true
  end
end
