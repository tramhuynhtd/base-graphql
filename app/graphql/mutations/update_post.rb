module Mutations
  class UpdatePost < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    field :post, Types::PostType, null: false

    def resolve(id:, title:nil, description: nil)
      current_user = ::Services::AuthorizeRequest.authentication(context)
      if current_user.admin? || current_user.teacher?
        if title.blank? && description.blank?
          raise GraphQL::ExecutionError, 'There is no field to update'
        end

        post = Post.find_by!(id: id, del_flag: false)
        post.title = title unless title.blank?
        post.description = description unless description.blank?

        return { post: post } if post.save

        raise GraphQL::ExecutionError, post.errors.full_messages.join(', ')
      else
        raise GraphQL::ExecutionError, 'Permission denied'
      end
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e
    end
  end
end
