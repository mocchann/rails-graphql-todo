# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :todos, [Types::TodoType], null: false
    def todos
      Todo.all
    end

    field :todo, Types::TodoType, null: false do
      argument :id, ID, required: true
    end
    def todo(id:)
      Todo.find(id)
    end

    field :todo_count, Integer, null: false
    def todo_count
      Todo.count
    end
  end
end
