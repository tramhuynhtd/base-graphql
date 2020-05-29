module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_users, [UserType], null: false
    field :all_posts, Types::PostType.connection_type, null: true
    # field :all_posts, PostConnectionCustomType, null: true, connection: true, max_page_size: 2

    field :post, PostType, null: false do
      argument :id, ID, required: true
    end

    def all_users
      ::Services::AuthorizeRequest.authentication(context)
      User.all
    end

    def all_posts
      Post.all.where(del_flag: false)
    end

    def post(id:)
      Post.find_by!(id: id, del_flag: false)
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e
    end
  end
end
