module Mutations
  class SignInUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentials:)
      user = User.find_by(username: credentials[:username])

      # ensures we have the correct user
      raise GraphQL::ExecutionError, 'Invalid username or password' unless user&.authenticate(credentials[:password])

      token = ::Services::AuthToken.token(user)

      {
        user: user,
        token: token
      }
    end
  end
end
