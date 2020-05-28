module Services
  class AuthorizeRequest
    def self.authentication(context)
      if context[:current_user].blank?
        raise GraphQL::ExecutionError, 'Authentication required'
      end

      return unless context[:current_user][:error]

      raise GraphQL::ExecutionError, context[:current_user][:error]
    end
  end
end
