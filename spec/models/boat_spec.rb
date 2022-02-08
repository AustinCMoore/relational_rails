require 'rails_helper'

RSpec.describe Boat, type: :model do
  describe 'relationships' do
    it { should belong_to(:dock) }
  end

  describe 'validates' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :crew_size}
    # it { should validate_presence_of :motor_powered}
  end

  describe 'methods' do
    before(:each) do
      @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
      @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
      @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
    end

    it "only returns boats that are motor powered" do
      # binding.pry
      Boat.is_motor_powered
      expect(Boat.is_motor_powered).to eq(@sea_ray)
    end

  end
end
