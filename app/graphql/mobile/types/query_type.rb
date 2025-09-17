# frozen_string_literal: true

module Mobile::Types
  class QueryType < Mobile::Types::BaseObject
    field :node, Mobile::Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Mobile::Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :todos, [Mobile::Types::TodoType], null: false, description: "Get all todos" do
      argument :limit, Integer, required: false, description: "Limit the number of todos returned"
    end

    def todos(limit: nil)
      relation = Todo.all
      relation = relation.limit(limit) if limit.present?
      relation
    end

    field :todo, Mobile::Types::TodoType, null: true, description: "Get a specific todo by ID" do
      argument :id, ID, required: true, description: "ID of the todo"
    end

    def todo(id:)
      Todo.find_by(id: id)
    end

    field :todo_count, Integer, null: false, description: "Get the total count of todos"

    def todo_count
      Todo.count
    end
  end
end
