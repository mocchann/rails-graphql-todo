module Resolver
  class Resolvers::Todo::TodoResolver < Resolvers::BaseResolver
    type Types::TodoType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      Todo.find_by(id: id)
    end
  end
end
