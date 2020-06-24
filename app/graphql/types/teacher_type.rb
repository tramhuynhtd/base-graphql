module Types
  class TeacherType < Types::BaseObject
    implements UserInterface
    field :teaching_subject, String, null: false
  end
end
