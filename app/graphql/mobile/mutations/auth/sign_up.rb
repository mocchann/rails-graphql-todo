# frozen_string_literal: true

module Mobile::Mutations::Auth
  class SignUp < Mobile::Mutations::BaseMutation
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Mobile::Types::UserType, null: true
    field :errors, [ String ], null: false

    def resolve(username:, email:, password:, password_confirmation:)
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
