class Aquarium < ApplicationRecord
  has_many :fish
  validates_presence_of :name
  validates_presence_of :clean
  validates_presence_of :number_of_types
end
