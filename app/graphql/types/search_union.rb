module Types
  class SearchUnion < Types::BaseUnion
    description 'Represents either a Teacher, Student'
    possible_types Types::TeacherType, Types::StudentType

    def self.resolve_type(object, _context)
      case object
      when Teacher then Types::TeacherType
      when Student then Types::StudentType
      else
        raise 'Unknown search result type'
      end
    end
  end
end
