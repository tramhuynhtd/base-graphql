module Types
  module InformationInterface
    include BaseInterface
    # description "Information of user"

    field :id, ID, null: false
    field :name, String, null: false
    field :gender, GenderEnum, null: false
    # field :gender, Boolean, "This is description for field", null: false
    field :birthday, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: false

    # def birthday
    #   # Optional: provide a special implementation of `birthday` here
    # end


    # # Optional, see below
    # definition_methods do
    #   # Optional: if this method is defined, it overrides `Schema.resolve_type`
    #   def resolve_type(object, context)
    #     # ...
    #   end
    # end
  end
end
