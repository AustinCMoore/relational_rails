require 'rails_helper'

RSpec.describe 'edit aquarium' do
  before(:each) do
    @shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
    
    visit "/aquariums/#{@shedd.id}/edit"
  end 
  
  scenario 'visitor sees form to edit aquarium attributes' do
    
    expect(current_path).to eq("/aquariums/#{@shedd.id}/edit")

    fill_in('Name', with: 'Shedd Aquarium')
    fill_in('Number of types', with: '500')
    fill_in('Clean', with: 'true')

    click_button 'Update Aquarium'
    expect(current_path).to eq("/aquariums/#{@shedd.id}")
    expect(page).to have_content('Shedd Aquarium')
  end
end