module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :username, String, null: false
    field :posts, PostType.connection_type, null: true
  end
end
