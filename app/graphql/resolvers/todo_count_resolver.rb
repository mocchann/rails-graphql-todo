module Resolvers
  class TodoCountResolver < BaseResolver
    type Integer, null: false

    def resolve
      Todo.count
    end
  end
end
