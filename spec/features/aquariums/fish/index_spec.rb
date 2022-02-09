require 'rails_helper'

RSpec.describe 'aquarium fish index' do

before(:each) do

@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)

@nemo = @shedd.fish.create!(name: 'Clownfish', bioluminescent: false, quantity: 70)
@dory = @shedd.fish.create!(name: 'Regal Tang', bioluminescent: false, quantity: 60)
@angler = @shedd.fish.create!(name: 'Angerfish', bioluminescent: true, quantity: 20)
@bubbles = @denver.fish.create!(name: 'Yellow Tang', bioluminescent: false, quantity: 50)
visit "/aquariums/#{@shedd.id}/fish"
end

  scenario 'visitor sees name of each fish associated with a particular aquarium' do

  expect(current_path).to eq("/aquariums/#{@shedd.id}/fish")
  expect(page).to have_content(@nemo.name)
  expect(page).to have_content(@nemo.bioluminescent)
  expect(page).to have_content(@nemo.quantity)
  expect(page).to_not have_content(@bubbles.name)
  end 

   scenario 'visitor sees link for fish index' do

    click_link("View Fish")
    expect(current_path).to eq( "/fish")
  end

  scenario 'visitor sees link for aquarium index' do

    click_link("View Aquariums")
    expect(current_path).to eq( "/aquariums")
  end 

  scenario 'visitor sees link to add new fish' do
    
    click_link("Create Fish")
    expect(current_path).to eq("/aquariums/#{@shedd.id}/fish/new")
  end
end