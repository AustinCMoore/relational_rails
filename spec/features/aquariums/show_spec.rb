require 'rails_helper'

RSpec.describe 'aquarium show ' do

before(:each) do

@shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
@denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
@nemo = @shedd.fish.create!(name: 'Clownfish', bioluminescent: false, quantity: 70)
@dory = @shedd.fish.create!(name: 'Regal Tang', bioluminescent: false, quantity: 60)
@angler = @shedd.fish.create!(name: 'Angerfish', bioluminescent: true, quantity: 20)
@bubbles = @denver.fish.create!(name: 'Yellow Tang', bioluminescent: false, quantity: 50)

 visit "/aquariums/#{@shedd.id}"
end

  scenario 'visitor sees aquarium attributes on specific aquarium show page' do

    expect(current_path).to eq("/aquariums/#{@shedd.id}")
    expect(page).to have_content(@shedd.name)
    expect(page).to have_content(@shedd.clean)
    expect(page).to have_content(@shedd.number_of_types)
    expect(page).to_not have_content(@denver.name)
  end 

  scenario 'visitor sees count of fish records associated with each aquarium' do

    expect(page).to have_content(@shedd.fish.count)
    expect(page).to have_content('Actual Quantity of Fish Types')
  end

  scenario 'visitor sees link for fish index' do

    click_link("View Fish")
    expect(current_path).to eq( "/fish")
  end

  scenario 'visitor sees link for aquarium index' do

    click_link("View Aquariums")
    expect(current_path).to eq( "/aquariums")
  end 

  scenario 'visitor sees link to aquarium_fish index' do

    click_link "View Aquarium Fish"
    expect(current_path).to eq("/aquariums/#{@shedd.id}/fish")
  end 

  scenario 'visitor sees link to update aquarium' do
   
    click_link "Update Aquarium"
    expect(current_path).to eq("/aquariums/#{@shedd.id}/edit")
  end

  scenario 'visitor sees link to delete an aquarium' do
    
    expect(page).to have_link("Delete Aquarium")
  end
end 