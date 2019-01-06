module Api
  module V1
    class MoviesPeopleSerializer < ActiveModel::Serializer
      attributes :role

      has_one :person
    end
  end
end
