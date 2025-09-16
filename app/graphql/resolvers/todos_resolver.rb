module Resolvers
  class TodosResolver < BaseResolver
    type [Types::TodoType], null: false

    argument :limit, Integer, required: false

    def resolve(limit: nil)
      relation = Todo.all
      relation = relation.limit(limit) if limit.present?
      relation
    end
  end
end
