module Types
  class TeacherType < Types::BaseObject
    implements UserInterface
    field :teaching_subject, String, null: false
    field :user, UserType, null: false
  end
end
