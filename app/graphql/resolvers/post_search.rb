module Resolvers
  class PostSearch < GraphQL::Schema::Resolver
    argument :filter, Types::PostFilterInput, required: false

    type Types::PostType.connection_type, null: false

    def resolve(filter: nil)
      # scope = Post.all.where(del_flag: false).order(title: :desc)
      scope = Post.all.where(del_flag: false)
      return scope if filter.nil?

      branches = normalize_filters(filter).reduce { |a, b| a.or(b) }
      scope.merge branches
    end

    def normalize_filters(value, branches = [])
      scope = Post.all.where(del_flag: false)
      scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
      scope = scope.where('title LIKE ?', "%#{value[:title_contains]}%") if value[:title_contains]

      branches << scope

      value[:or].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:or].present?
      branches
    end
  end
end
