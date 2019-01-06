class PeopleMovie < ApplicationRecord
  enum role: [ :actor_actress, :director, :producer ]

  belongs_to :person
  belongs_to :movie
end
