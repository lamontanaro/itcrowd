module Api
  module V1
    class PeopleSerializer < ActiveModel::Serializer
      attributes :id, :last_name, :first_name, :aliases

      has_many :people_movies, serializer: Api::V1::PeopleMoviesSerializer
    end
  end
end
