# frozen_string_literal: true

module Mobile::Mutations::Auth
  class SignUp < Mobile::Mutations::BaseMutation
    argument :input, Mobile::Types::SignUp, required: true

    field :user, Mobile::Types::UserType, null: true
    field :errors, [ String ], null: false

    def resolve(input:)
      username = input[:username]
      email = input[:email]
      password = input[:password]
      password_confirmation = input[:password_confirmation]
      user = User.new(
        username: username,
        email: email,
        password: password,
        password_confirmation: password_confirmation
      )

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
