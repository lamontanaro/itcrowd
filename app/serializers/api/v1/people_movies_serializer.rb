module Api
  module V1
    class PeopleMoviesSerializer < ActiveModel::Serializer
      attributes :role

      has_one :movie
    end
  end
end
