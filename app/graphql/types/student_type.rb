module Types
  class StudentType < Types::BaseObject
    # implements InformationInterface
    field :class_name, String, null: false
    field :user, UserType, null: false
  end
end
