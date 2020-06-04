module Types
  class TeacherType < Types::BaseObject
    # implements Types::InformationInterface
    field :teaching_subject, String, null: false
    field :user, UserType, null: false
  end
end
