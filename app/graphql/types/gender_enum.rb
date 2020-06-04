module Types
  class GenderEnum < Types::BaseEnum
    value "MALE", value: true
    value "FEMALE", value: false
  end

# Each value may have:

# A description (as the second argument or description: keyword)
# A deprecation reason (as deprecation_reason:), marking this value as deprecated
# A corresponding Ruby value (as value:)

end
