module Types
  class InformationInput < BaseInputObject
    argument :name, String, required: true
    argument :gender, GenderEnum, required: true
    argument :birthday, DateTimeScalar, required: true
    # argument :birthday, GraphQL::Types::ISO8601DateTime, required: true
  end
end
