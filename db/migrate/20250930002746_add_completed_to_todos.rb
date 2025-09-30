class AddCompletedToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :completed, :boolean
  end
end
