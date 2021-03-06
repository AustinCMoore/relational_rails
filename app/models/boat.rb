class Boat < ApplicationRecord
  belongs_to :dock
  validates_presence_of :name
  validates_presence_of :crew_size
  validates :motor_powered, inclusion: [true, false]

  def self.is_motor_powered
    where(motor_powered: true)
  end

  def self.alphabetize
    order(:name)
  end

  def self.greater_than(number)
    where("crew_size > ?", number)
  end
end
