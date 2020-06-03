module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String, null: false
    field :posts, PostType.connection_type, null: true
    field :information, UserUnion, null: false
    # field :teachers, TeacherType, null: true
  end
end
