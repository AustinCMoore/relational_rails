require 'rails_helper'

RSpec.describe 'delete aquarium record' do
  scenario 'visitor sees link to delete an aquarium' do

    @shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
    visit "/aquariums/#{@shedd.id}"
    
    click_link "Delete Aquarium"
    expect(current_path).to eq("/aquariums")
    expect(page).to_not have_content(@shedd.name)
  end

  scenario 'visitor sees link to delete an aquarium' do

    @shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
    visit "/aquariums"
    
    click_link "Delete #{@shedd.name}"
    expect(current_path).to eq("/aquariums")
    expect(page).to_not have_content(@shedd.name)
  end
end