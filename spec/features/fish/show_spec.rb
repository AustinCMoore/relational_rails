require 'rails_helper'

RSpec.describe 'fish show page' do

before(:each) do
@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
@angler = @shedd.fish.create!(name: 'Anglerfish', bioluminescent: true, quantity: 10)
@bruce = @national.fish.create!(name: 'Great White Shark', bioluminescent: false, quantity: 10)
end

  scenario 'visitor sees name of each fish in system' do
    visit "/fish/#{@angler.id}"

  expect(current_path).to eq("/fish/#{@angler.id}")
  expect(page).to have_content(@angler.name)
  expect(page).to have_content(@angler.bioluminescent)
  expect(page).to have_content(@angler.quantity)
  expect(page).to_not have_content(@bruce.name)
  save_and_open_page
  end 
end