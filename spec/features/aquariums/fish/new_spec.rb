require 'rails_helper'

RSpec.describe 'form to create aquarium fish' do

  before(:each) do

    @shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
    @nemo = @shedd.fish.create!(name: 'Clownfish', bioluminescent: false, quantity: 70)
    @dory = @shedd.fish.create!(name: 'Regal Tang', bioluminescent: false, quantity: 60)

    visit "/aquariums/#{@shedd.id}/fish/new"
  end 

  scenario 'visitor can create a new fish and it lists on index page' do
    fill_in('Name', with: 'Bubbles')
    fill_in('Quantity', with: 50)
    fill_in('Bioluminescent', with: false)
    click_button 'Create Fish'
    expect(current_path).to eq("/aquariums/#{@shedd.id}/fish")
    expect(page).to have_content('Bubbles')
  end

end 