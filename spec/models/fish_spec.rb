require 'rails_helper'

RSpec.describe Fish, type: :model do
  describe 'relationships' do
    it { should belong_to(:aquarium) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :quantity}
    it { should allow_value(false).for(:bioluminescent) }
    it { should allow_value(true).for(:bioluminescent) }
  end

  describe 'class methods' do

    before(:each) do
     @national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
     @bruce = @national.fish.create!(name: 'Great White Shark', bioluminescent: false, quantity: 10)
     @gill = @national.fish.create!(name: 'Moorish Idol', bioluminescent: false, quantity: 40)
    end

    it '#self.alphabetize' do
      expect(Fish.alphabetize).to eq([@bruce, @gill])
    end

    it '#greater_than' do
      expect(Fish.greater_than(10)).to eq([@gill])
    end
  end
end
