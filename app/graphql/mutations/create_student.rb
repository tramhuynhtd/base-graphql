module Mutations
  class CreateStudent < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true
    argument :information, Types::InformationInput, required: true
    argument :class_name, String, required: true

    field :student, Types::StudentType, null: false

    def resolve(information:, class_name:, credentials:)
      current_user = ::Services::AuthorizeRequest.authentication(context)
      if current_user.admin? || current_user.teacher?
        user = User.new(
          username: credentials[:username],
          password: credentials[:password],
          name: information[:name],
          gender: information[:gender],
          birthday: information[:birthday],
          role: User.roles[:student]
        )

        if user.save
          student = Student.create!(
            class_name: class_name,
            user: user
          )

          return { student: student } if student.save

          raise GraphQL::ExecutionError, student.errors.full_messages.join(', ')
        else
          raise GraphQL::ExecutionError, user.errors.full_messages.join(', ')
        end
      else
        raise GraphQL::ExecutionError, 'Permission denied'
      end
    end
  end
end
