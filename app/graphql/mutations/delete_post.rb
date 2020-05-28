module Mutations
  class DeletePost < BaseMutation
    argument :id, ID, required: true

    field :message, String, null: true

    def resolve(id:)
      post = Post.find_by!(id: id, del_flag: false)
      post.del_flag = true
      return { message: 'delete successfully' } if post.save

      raise GraphQL::ExecutionError, post.errors.full_messages.join(', ')

    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e
    end
  end
end
