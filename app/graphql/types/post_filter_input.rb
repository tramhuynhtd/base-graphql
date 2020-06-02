module Types
  class PostFilterInput < BaseInputObject
    graphql_name 'PostFilter'

    argument :or, [self], required: false
    argument :description_contains, String, required: false
    argument :title_contains, String, required: false
  end
end
