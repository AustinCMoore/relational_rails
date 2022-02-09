require 'rails_helper'

RSpec.describe 'edit fish' do
  before(:each) do
    @national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
    @bruce = @national.fish.create!(name: 'Great White Shark', bioluminescent: false, quantity: 10)
    
    visit "/fish/#{@bruce.id}/edit"
  end 
  
  scenario 'visitor sees form to edit fish attributes' do
    
    expect(current_path).to eq("/fish/#{@bruce.id}/edit")

    fill_in('Name', with: 'Bruce')
    fill_in('Quantity', with: 20)
    fill_in('Bioluminescent', with: false)

    click_button 'Update Fish'
    expect(current_path).to eq("/fish/#{@bruce.id}")
    expect(page).to have_content('Bruce')
  end
end