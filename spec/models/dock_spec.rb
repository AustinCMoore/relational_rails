require 'rails_helper'

RSpec.describe Dock, type: :model do
  describe 'relationships' do
    it { should have_many(:boats) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :capacity }
    # it { should allow_value(false).for(:open)}
    # it { should allow_value(true).for(:open)}
  end

  describe 'instance methods' do
    describe '#count_boats' do
      before(:each) do
        @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
        @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
        @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
      end

      it "counts the number of boats a dock has" do
        expect(@baltimore.count_boats).to eq(2)
      end
    end
  end
end
