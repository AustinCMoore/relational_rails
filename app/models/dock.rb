class Dock < ApplicationRecord
  has_many :boats
  validates_presence_of :name
  validates_presence_of :open
  validates_presence_of :capacity
end

#For each parent table
#as a visitor
#when I visit '/parents'
#Then I see the name of each parent record in the system
