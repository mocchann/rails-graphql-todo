# frozen_string_literal: true

module Mobile::Mutations::Auth
  class SignOut < Mobile::Mutations::BaseMutation
    field :success, Boolean, null: false
    field :errors, [ String ], null: false

    def resolve
      if context[:current_user]
        sign_out(context[:current_user])
        { success: true, errors: [] }
      else
        { success: false, errors: [ "Not signed in" ] }
      end
    end

    private

    def sign_out(user)
      warden.logout(:user)
    end

    def warden
      context[:request].env["warden"]
    end
  end
end
