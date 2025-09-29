# frozen_string_literal: true

# Public API for Todo business logic
class TodoService
  def self.create_todo(user:, title:, description: nil)
    user.todos.create!(
      title: title,
      description: description
    )
  end

  def self.update_todo(todo:, title: nil, description: nil, completed: nil)
    update_params = {}
    update_params[:title] = title if title
    update_params[:description] = description if description
    update_params[:completed] = completed if !completed.nil?
    
    todo.update!(update_params)
    todo
  end

  def self.delete_todo(todo:)
    todo.destroy!
  end

  def self.find_todos_for_user(user:)
    user.todos.order(created_at: :desc)
  end
end
