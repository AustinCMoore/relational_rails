require 'rails_helper'

RSpec.describe 'aquarium show ' do

before(:each) do

@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
end

  scenario 'visitor sees aquarium attributes on specific aquarium show page' do
    visit "/aquariums/#{@shedd.id}"

    expect(page).to have_content("#{@shedd.name}")
    expect(page).to have_content("#{@shedd.clean}")
    expect(page).to have_content("#{@shedd.number_of_types}")
  end 
end 