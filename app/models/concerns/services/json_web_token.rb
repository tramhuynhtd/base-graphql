module Services
  class JsonWebToken
    HMAC_SECRET = Rails.application.secrets.secret_key_base
    EXPIER_HOUR = Rails.application.secrets.expier_hour.to_i
    def self.encode(payload, exp = EXPIER_HOUR.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, HMAC_SECRET)
    end

    def self.decode(token)
      body = JWT.decode(token, HMAC_SECRET)[0]
      HashWithIndifferentAccess.new body
    rescue JWT::DecodeError
      {
        error: 'Invalid token'
      }
    end
  end
end
