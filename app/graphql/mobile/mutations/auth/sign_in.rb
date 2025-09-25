# frozen_string_literal: true

module Mobile::Mutations::Auth
  class SignIn < Mobile::Mutations::BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Mobile::Types::UserType, null: true
    field :errors, [ String ], null: false

    def resolve(email:, password:)
      user = User.find_for_database_authentication(login: email)

      if user && user.valid_password?(password)
        sign_in(user)
        { user: user, errors: [] }
      else
        { user: nil, errors: [ "Invalid email or password" ] }
      end
    end

    private

    def sign_in(user)
      warden.set_user(user, scope: :user)
    end

    def warden
      request.env["warden"]
    end
  end
end
