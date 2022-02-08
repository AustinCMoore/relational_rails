class Dock < ApplicationRecord
  has_many :boats
  validates_presence_of :name
  validates_presence_of :capacity
  # validates :open, inclusion: [true, false]

  def self.recent_order
    order(created_at: :desc)
  end

  def count_boats
    self.boats.count
  end
end
