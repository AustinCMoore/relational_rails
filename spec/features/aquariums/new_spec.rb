require 'rails_helper'

describe 'new aquarium form' do
  scenario 'visitor sees link on aquarium index' do
    visit '/aquariums'

    click_link "New Aquarium"
    expect(current_path).to eq("/aquariums/new")
  end

  scenario 'form creates new aquarium and lists on index view' do
    visit '/aquariums/new'

    fill_in('Name', with: 'Shedd Aquarium')
      fill_in('Clean', with: true)
      fill_in('Number of types', with: 100)
      click_on 'Create Aquarium'
      expect(current_path).to eq('/aquariums')
      expect(page).to have_content('Shedd Aquarium')
  end
end