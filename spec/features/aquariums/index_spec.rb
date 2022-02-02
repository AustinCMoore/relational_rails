require 'rails_helper'

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)


RSpec.describe 'aquarium index' do
  scenario 'visitor sees name of each aquarium record in system' do
    visit '/aquariums'

  expect(page).to have_content(shedd.name)
  expect(page).to have_content(shedd.clean?)
  expect(page).to have_content(shedd.number_of_types)
  end 
end