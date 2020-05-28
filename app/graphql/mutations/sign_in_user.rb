module Mutations
  class SignInUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :errors, String, null: true

    def resolve(credentials:)
      # base valid
      error = { errors: 'Invalid username or password' }
      return error unless credentials

      user = User.find_by(username: credentials[:username])

      # ensures we have the correct user
      return error unless user
      return error unless user.authenticate(credentials[:password])

      token = ::Services::AuthToken.token(user)

      {
        user: user,
        token: token
      }
    end
  end
end
