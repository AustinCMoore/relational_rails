require 'rails_helper'

RSpec.describe 'aquarium show ' do

before(:each) do

@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
@nemo = @shedd.fish.create!(name: 'Clownfish', bioluminescent: false, quantity: 70)
@dory = @shedd.fish.create!(name: 'Regal Tang', bioluminescent: false, quantity: 60)
@angler = @shedd.fish.create!(name: 'Angerfish', bioluminescent: true, quantity: 20)
@bubbles = @denver.fish.create!(name: 'Yellow Tang', bioluminescent: false, quantity: 50)
end

  scenario 'visitor sees aquarium attributes on specific aquarium show page' do
    visit "/aquariums/#{@shedd.id}"

    expect(current_path).to eq("/aquariums/#{@shedd.id}")
    expect(page).to have_content(@shedd.name)
    expect(page).to have_content(@shedd.clean)
    expect(page).to have_content(@shedd.number_of_types)
    expect(page).to_not have_content(@denver.name)
  end 

  scenario 'visitor sees count of fish records associated with each aquarium' do
    visit "/aquariums/#{@shedd.id}"
    
    expect(page).to have_content(@shedd.fish.count)
    expect(page).to have_content('Actual Quantity of Fish Types')
  end

  scenario 'visitor sees link for fish index' do
    visit "/aquariums/#{@shedd.id}"

    expect(page).to have_link("View Fish")
  end

  scenario 'visitor sees link for aquarium index' do
    visit "/aquariums/#{@shedd.id}"

    click_link("View Aquariums")
    expect(current_path).to eq( "/aquariums")
  end 
end 