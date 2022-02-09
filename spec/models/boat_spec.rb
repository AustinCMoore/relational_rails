require 'rails_helper'

RSpec.describe Boat, type: :model do
  describe 'relationships' do
    it { should belong_to(:dock) }
  end

  describe 'validates' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :crew_size}
    it { should allow_value(false).for(:motor_powered)}
    it { should allow_value(true).for(:motor_powered)}
  end

  describe 'class methods' do

    before(:each) do
      @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
      @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
      @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
    end

    it '#self.is_motor_powered' do
      expect(Boat.is_motor_powered).to eq([@sea_ray])
    end
  end
end
