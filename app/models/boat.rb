class Boat < ApplicationRecord
  belongs_to :dock
  validates_presence_of :name
  validates_presence_of :crew_size
  validates_presence_of :motor_powered
end
