class Dock < ApplicationRecord
  has_many :boats
  validates_presence_of :name
  validates_presence_of :open
  # validates_presence_of :capacity

  def self.recent_order
    # Dock.all.sort_by(&:created_at).reverse #ruby method
    order(created_at: :desc)
  end

  def count_boats
    self.boats.count
  end
end
