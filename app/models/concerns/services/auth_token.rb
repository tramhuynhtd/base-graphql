module Services
  class AuthToken

    def self.token(user)
      payload = { user_id: user.id }
      JsonWebToken.encode(payload)
    end

    def self.verify(token)
      result = JsonWebToken.decode(token)
      return result[:error] if result[:error]

      User.find(result[:ok][:user_id])
    end
  end

end
