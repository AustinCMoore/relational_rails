class Dock < ApplicationRecord
  has_many :boats
  validates_presence_of :name
  validates_presence_of :open
  validates_presence_of :capacity
end
