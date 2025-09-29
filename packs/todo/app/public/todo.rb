# frozen_string_literal: true

# Public API for Todo model
class Todo < ApplicationRecord
  belongs_to :user
end
