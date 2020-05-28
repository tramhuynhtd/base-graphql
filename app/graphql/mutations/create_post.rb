module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true

    field :post, Types::PostType, null: false

    def resolve(title:, description:)
      ::Services::AuthorizeRequest.authentication(context)

      post = Post.new(
        title: title,
        description: description,
        del_flag: false,
        user: context[:current_user]
      )

      return { post: post } if post.save

      raise GraphQL::ExecutionError, post.errors.full_messages.join(', ')
    end
  end
end
