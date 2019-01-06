class Movie < ApplicationRecord
  has_many :people_movies

  validates :title, :release_year, presence: true
end
