module Resolvers
  module Todo
    class TodosResolver < Resolvers::BaseResolver
      type [Types::TodoType], null: false

      argument :limit, Integer, required: false

      def resolve(limit: nil)
        relation = ::Todo.all
        relation = relation.limit(limit) if limit.present?
        relation
      end
    end
  end
end
