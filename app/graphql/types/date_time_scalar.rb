module Types
  class DateTimeScalar < BaseScalar
    description "Formatted DateTime object" # This is description of class scalar

    def self.coerce_input(input_value, context)
      # Parse the incoming object into a `DateTime`
      DateTime.parse(input_value)
    rescue ArgumentError
      raise GraphQL::CoercionError, "#{input_value.inspect} is not a valid DateTime"  # This is custom the messeage error
    end

    def self.coerce_result(ruby_value, context)
      # It's transported as a string, so stringify it
      ruby_value.strftime('%d/%m/%Y')
      # ruby_value.to_s
    end

    # self.coerce_input takes a GraphQL input and converts it into a Ruby value
    # self.coerce_result takes the return value of a field and prepares it for the GraphQL response JSON
  end
end
