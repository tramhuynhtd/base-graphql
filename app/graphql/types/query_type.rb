module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_users, [UserType], null: false

    def all_users
      ::Services::AuthorizeRequest.authentication(context)
      User.all
    end

    field :all_posts, [PostType], null: true

    def all_posts
      Post.all.where(del_flag: false)
    end
  end
end
