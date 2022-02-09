require 'rails_helper'

RSpec.describe Aquarium, type: :model do

  describe 'relationships' do
    it { should have_many(:fish) }
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :clean}
    it { should validate_presence_of :number_of_types}
  end

  describe 'instance methods' do
  
    before(:each) do
      @shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
      @national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
      @denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
      @angler = @shedd.fish.create!(name: 'Anglerfish', bioluminescent: true, quantity: 10)
      @bruce = @national.fish.create!(name: 'Great White Shark', bioluminescent: false, quantity: 10)
    end

    it "counts the number of fish for an Aquarium" do
      expect(@shedd.number_of_fish).to eq(1)
      expect(@denver.number_of_fish).to eq(0)
    end
  end 

  describe 'class methods' do

    before(:each) do
     @national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
     @nyc = Aquarium.create!(name: 'New York Aquarium', clean: true, number_of_types: 150)
     @gill = @national.fish.create!(name: 'Moorish Idol', bioluminescent: false, quantity: 40)
     @eel = @nyc.fish.create!(name: 'Gulper Eel', bioluminescent: true, quantity: 30)
    end

    it '#self.created_first' do
      expect(Aquarium.created_first).to eq([@nyc, @national])
    end
  end 
end 

