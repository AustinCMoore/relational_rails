require 'rails_helper'

RSpec.describe 'aquarium show ' do

before(:each) do

@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
end

  scenario 'visitor sees aquarium attributes on specific aquarium show page' do
    visit "/aquariums/#{@shedd.id}"

    expect(current_path).to eq("/aquariums/#{@shedd.id}")
    expect(page).to have_content(@shedd.name)
    expect(page).to have_content(@shedd.clean)
    expect(page).to have_content(@shedd.number_of_types)
    expect(page).to_not have_content(@denver.name)
  end 
end 