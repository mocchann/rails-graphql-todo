# frozen_string_literal: true

# AuthService provides a public API for authentication operations
class AuthService
  # User management
  def self.find_user(id)
    User.find(id)
  end

  def self.find_user_by_email(email)
    User.find_by(email: email)
  end

  def self.find_user_for_authentication(login:)
    User.find_for_database_authentication(login: login)
  end

  def self.create_user(params)
    User.create!(params)
  end

  def self.update_user(user, params)
    user.update!(params)
  end

  def self.destroy_user(user)
    user.destroy!
  end

  # Authentication
  def self.valid_password?(user, password)
    user.valid_password?(password)
  end

  def self.sign_in(user, warden)
    warden.set_user(user, scope: :user)
  end

  def self.sign_out(warden)
    warden.logout(:user)
  end

  # User queries
  def self.user_todos(user)
    user.todos
  end

  def self.user_todo_count(user)
    user.todos.count
  end
end
