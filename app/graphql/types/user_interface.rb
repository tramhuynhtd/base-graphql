module Types
  module UserInterface
    include BaseInterface
    # description "Information of user"

    field :id, ID, null: false
    field :user, UserType, null: false

    # def user
    #   # Optional: provide a special implementation of `user` here
    # end


    # Optional, see below
    definition_methods do
      # Optional: if this method is defined, it overrides `Schema.resolve_type`
       # Determine what object type to use for `object`

      def resolve_type(object, context)
        if object.is_a?(::Teacher)
          Types::TeacherType
        elsif object.is_a?(::Student)
          Types::StudentType
        else
          raise "Unexpected : #{object.inspect}"
        end
      end
    end
  end
end
