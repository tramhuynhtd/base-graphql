module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :delelte_post, mutation: Mutations::DeletePost
    field :create_teacher, mutation: Mutations::CreateTeacher
    field :create_student, mutation: Mutations::CreateStudent
  end
end
