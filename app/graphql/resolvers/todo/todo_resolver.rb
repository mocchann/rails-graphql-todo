module Resolvers
  module Todo
    class TodoResolver < Resolvers::BaseResolver
      type Types::TodoType, null: true

      argument :id, ID, required: true

      def resolve(id:)
        ::Todo.find_by(id: id)
      end
    end
  end
end
