class Fish < ApplicationRecord
  belongs_to :aquarium
  validates_presence_of :name
  validates_presence_of :bioluminescent
  validates_presence_of :quantity
end
