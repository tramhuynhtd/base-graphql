module Types
  class UserEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(UserType)
  end

  class UserConnectionCustomType < GraphQL::Types::Relay::BaseConnection
    edge_type(UserEdgeType)

    field :total_count, Integer, null: false

    def total_count
      object.nodes&.size
    end
  end
end
