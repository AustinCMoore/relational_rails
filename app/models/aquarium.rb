class Aquarium < ApplicationRecord
  has_many :fish
  validates_presence_of :name
  validates_presence_of :clean
  validates_presence_of :number_of_types
  # default_scope { order(created_at: :desc) }
  
  def self.created_first
    order(created_at: :desc) #ORDER('created_at desc')
  end

  def number_of_fish
    self.fish.count
  end
end
