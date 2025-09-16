module Resolvers
  module Todo
    class TodoCountResolver < Resolvers::BaseResolver
      type Integer, null: false

      def resolve
        ::Todo.count
      end
    end
  end
end
