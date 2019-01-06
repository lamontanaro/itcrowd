module Api
  module V1
    class MovieSerializer < ActiveModel::Serializer
      attributes :id, :title, :release_year

      has_many :people_movies, serializer: Api::V1::MoviesPeopleSerializer
    end
  end
end
