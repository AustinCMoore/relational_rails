require 'rails_helper'

RSpec.describe 'fish show page' do

before(:each) do
@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
@angler = @shedd.fish.create!(name: 'Anglerfish', bioluminescent: true, quantity: 10)
@bruce = @national.fish.create!(name: 'Great White Shark', bioluminescent: false, quantity: 10)

visit "/fish/#{@angler.id}"
end

  scenario 'visitor sees name of each fish in system' do

  expect(current_path).to eq("/fish/#{@angler.id}")
  expect(page).to have_content(@angler.name)
  expect(page).to have_content(@angler.bioluminescent)
  expect(page).to have_content(@angler.quantity)
  expect(page).to_not have_content(@bruce.name)
  end 

  scenario 'visitor sees link for fish index' do

    click_link("View Fish")
    expect(current_path).to eq( "/fish")
  end

  scenario 'visitor sees link for aquarium index' do

    click_link("View Aquariums")
    expect(current_path).to eq( "/aquariums")
  end

   scenario 'visitor sees link to update fish record' do
    
    click_link("Update Fish")
    expect(current_path).to eq("/fish/#{@angler.id}/edit")
  end

  scenario 'visitor sees link to delete a fish' do
    
    expect(page).to have_link("Delete Fish")
  end
end