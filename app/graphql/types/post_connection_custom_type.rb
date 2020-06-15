module Types
  class PostEdgeType < GraphQL::Types::Relay::BaseEdge
    # field :total, Integer, null: false

    # def total
    #   object.node.size
    # end
    node_type(PostType)
  end

  class PostConnectionCustomType < GraphQL::Types::Relay::BaseConnection

    edge_type(PostEdgeType)
    field :total_count, Integer, null: false

    def total_count
      object.nodes&.size
    end
  end
end
