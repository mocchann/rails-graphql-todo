module Resolver
  class Resolvers::Todo::TodoCountResolver < Resolvers::BaseResolver
    type Integer, null: false

    def resolve
      Todo.count
    end
  end
end
