module Mutations
  class CreateTeacher < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true
    argument :information, Types::InformationInput, required: true
    argument :teaching_subject, String, required: true

    field :teacher, Types::TeacherType, null: false

    def resolve(information:, teaching_subject:, credentials:)
      # ::Services::AuthorizeRequest.authentication(context)

      user = User.new(
        username: credentials[:username],
        password: credentials[:password],
        name: information[:name],
        gender: information[:gender],
        birthday: information[:birthday],
        role: User.roles[:teacher]
      )

      if user.save
        teacher = Teacher.create!(
          teaching_subject: teaching_subject,
          user: user
        )

        return { teacher: teacher } if teacher.save

        raise GraphQL::ExecutionError, teacher.errors.full_messages.join(', ')
      else
        raise GraphQL::ExecutionError, user.errors.full_messages.join(', ')
      end
    end
  end
end
