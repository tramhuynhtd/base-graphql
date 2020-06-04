module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :posts, PostType.connection_type, null: true
    # field :information, UserUnion, null: false
    field :name, String, null: false
    field :gender, GenderEnum, null: false
    field :birthday, DateTimeScalar, null: false
    field :role, RoleEnum, null: false
  end
end
