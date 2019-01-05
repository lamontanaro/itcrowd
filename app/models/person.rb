class Person < ApplicationRecord
  validates :first_name, :last_name, :aliases, presence: true
end
