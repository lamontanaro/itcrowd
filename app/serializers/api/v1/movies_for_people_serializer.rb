module Api
  module V1
    class MoviesForPeopleSerializer < ActiveModel::Serializer
      attributes :id, :title, :release_year
    end
  end
end
