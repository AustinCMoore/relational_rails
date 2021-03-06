class Fish < ApplicationRecord
  belongs_to :aquarium
  validates_presence_of :name
  validates :bioluminescent, inclusion: [true, false]
  validates_presence_of :quantity

  def self.alphabetize
    order(:name)
  end

  def self.greater_than(number)
    where("quantity > ?", number)
  end
end 
