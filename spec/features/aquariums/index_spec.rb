require 'rails_helper'

RSpec.describe 'aquarium index' do

before(:each) do

@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
end

  scenario 'visitor sees name of each aquarium record in system' do
    visit '/aquariums'

  expect(current_path).to eq("/aquariums")
  expect(page).to have_content(@shedd.name)
  expect(page).to have_content(@national.name)
  expect(page).to have_content(@denver.name)
  expect(page).to_not have_content(@shedd.clean)
  end 

   scenario 'visitor sees link for fish index' do
    visit "/aquariums/"

    expect(page).to have_link("View Fish")
  end

  scenario 'visitor sees link for aquarium index' do
    visit "/aquariums"

   click_link("View Aquariums")
   expect(current_path).to eq( "/aquariums")
  end
end