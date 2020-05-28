module Types
  class AuthProviderCredentialsInput < BaseInputObject
    argument :username, String, required: true
    argument :password, String, required: true
  end
end
