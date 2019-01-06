module Api
  module V1
    class PeopleMoviesSerializer < ActiveModel::Serializer
      attributes :role

      has_one :movie, serializer: Api::V1::MoviesForPeopleSerializer
    end
  end
end
