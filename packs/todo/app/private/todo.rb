# frozen_string_literal: true

# Public API for Todo model
class Todo < ApplicationRecord
  belongs_to :user
  
  # Set default value for completed field
  attribute :completed, :boolean, default: false
end
