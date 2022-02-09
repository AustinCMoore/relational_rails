require 'rails_helper'

RSpec.describe 'fish index' do

before(:each) do
  @shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
  @national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
  @denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
  @angler = @shedd.fish.create!(name: 'Anglerfish', bioluminescent: true, quantity: 10)
  @bruce = @national.fish.create!(name: 'Great White Shark', bioluminescent: false, quantity: 10)
  @bob = @national.fish.create!(name: 'Hawaiin Bobtail Squid', bioluminescent: true, quantity: 50)
  @jelly = @denver.fish.create!(name: 'Mauve Stinger', bioluminescent: true, quantity: 20)

  visit '/fish'
end

  scenario 'visitor sees name of each fish in system' do

  expect(current_path).to eq("/fish")
  expect(page).to have_content(@angler.name)
  expect(page).to have_content(@angler.bioluminescent)
  expect(page).to have_content(@angler.quantity)
  end

   scenario 'visitor sees link for fish index' do

    click_link("View Fish")
    expect(current_path).to eq( "/fish")
  end

  scenario 'visitor sees link for aquarium index' do

    click_link("View Aquariums")
    expect(current_path).to eq( "/aquariums")
  end

  scenario 'visitor sees only fish where bioluminescent is true' do
    expect(page).to have_content(@bob.name)
    expect(page).to have_content(@jelly.name)
    expect(page).to_not have_content(@bruce.name)
  end

  scenario 'visitor sees link to delete fish record' do
    click_on "Delete #{@jelly.name}"
    expect(current_path).to eq("/fish")
    expect(page).to_not have_content("#{@jelly.name}")
  end

  scenario 'visitor sees link to edit fish info' do

    expect(current_path).to eq("/fish")
    click_link("Edit #{@angler.name}")
    expect(current_path).to eq("/fish/#{@angler.id}/edit")
  end
end
