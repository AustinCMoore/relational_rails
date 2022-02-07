require 'rails_helper'

RSpec.describe 'aquarium index' do

before(:each) do

@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
@nyc = Aquarium.create!(name: 'New York Aquarium', clean: true, number_of_types: 150)
end

  scenario 'visitor sees name of each aquarium record in system' do
    visit '/aquariums'

  expect(current_path).to eq("/aquariums")
  expect(page).to have_content(@shedd.name)
  expect(page).to have_content(@nyc.name)
  expect(page).to have_content(@denver.name)

  expect(page).to_not have_content(@shedd.clean)
  end 

  scenario 'visitor sees records ordered by #created_at and timestamp' do
    visit '/aquariums'

      expect(page).to have_content(@shedd.created_at)
      expect(page).to have_content(@nyc.created_at)
      expect(page).to have_content(@denver.created_at)
      expect(@denver.name).to appear_before(@shedd.name)
    end
  end