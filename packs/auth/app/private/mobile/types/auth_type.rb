# frozen_string_literal: true

module Mobile::Types
  class AuthType < Mobile::Types::BaseObject
    field :user, Mobile::Types::UserType, null: true
    field :signed_in, Boolean, null: false

    def user
      context[:current_user]
    end

    def signed_in
      context[:current_user].present?
    end
  end
end
