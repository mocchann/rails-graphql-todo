# frozen_string_literal: true

# TodoService provides a public API for todo operations
class TodoService
  # Todo management
  def self.find_todo(id)
    Todo.find(id)
  end

  def self.find_todo_by_user_and_id(user_id:, id:)
    Todo.find_by(id: id, user_id: user_id)
  end

  def self.find_todos_by_user(user_id:, limit: nil)
    todos = Todo.where(user_id: user_id)
    todos = todos.limit(limit) if limit
    todos
  end

  def self.create_todo(params)
    Todo.create!(params)
  end

  def self.update_todo(todo, params)
    todo.update!(params)
  end

  def self.destroy_todo(todo)
    todo.destroy!
  end

  # Todo queries
  def self.todo_count_by_user(user_id:)
    Todo.where(user_id: user_id).count
  end

  # Business logic
  def self.create_todo_with_user(title:, content:, user:)
    Todo.create!(
      title: title,
      content: content,
      user: user
    )
  end

  def self.update_todo_with_params(todo:, title: nil, content: nil, completed: nil)
    update_params = {}
    update_params[:title] = title if title
    update_params[:content] = content if content
    update_params[:completed] = completed if !completed.nil?

    todo.update!(update_params)
    todo
  end
end