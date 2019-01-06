class Person < ApplicationRecord
  has_many :people_movies

  validates :first_name, :last_name, :aliases, presence: true
end
