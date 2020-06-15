module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # field :all_users, UserType.connection_type, null: false
    # field :all_users, UserConnectionCustomType, null: false, connection: true
    field :all_teachers_students, [UserInterface], null: false
    # field :all_posts, Types::PostType.connection_type, null: true
    # field :all_posts, resolver: Resolvers::PostSearch
    # field :all_posts, PostConnectionCustomType, null: true, connection: true

    field :post, PostType, null: false do
      argument :id, ID, required: true
    end

    field :user, UserType, null: false do
      argument :id, ID, required: true
    end

    field :search, [SearchUnion], null: false do
      argument :text, String, required: true
    end

    field :all_students, StudentType.connection_type, null: false

    def search(text:)
      teachers = Teacher.where('teaching_subject LIKE ?', "%#{text}%")
      students = Student.where('class_name LIKE ?', "%#{text}%")
      teachers + students
    end

    # def all_users
    #   # ::Services::AuthorizeRequest.authentication(context)
    #   User.all
    # end
    def all_teachers_students
      Teacher.all + Student.all
    end

    def all_posts
      Post.all.where(del_flag: false)
    end

    def post(id:)
      Post.find_by!(id: id, del_flag: false)
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e
    end

    def user(id:)
      User.find_by!(id: id)
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError, e
    end

    def all_students
      # ::Services::AuthorizeRequest.authentication(context)
      Student.all
    end
  end
end
