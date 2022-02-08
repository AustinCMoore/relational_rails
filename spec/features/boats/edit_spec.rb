require "rails_helper"

RSpec.describe 'Edit Child' do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: true, crew_size: 2)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
  end
  describe 'A visitor can edit a boat from its show page' do
    it 'links to the edit page form' do
      visit "/boats/#{@hobie.id}"
      click_on 'Update Boat'
      expect(current_path).to eq("/boats/#{@hobie.id}/edit")
    end

    it 'can edit a boat and list it on the show page' do
      visit "/boats/#{@hobie.id}/edit"

      fill_in('Name', with: 'Tracker')
      fill_in('motor_powered', with: true)
      fill_in('crew_size', with: 5)
      click_on 'Update Boat'
      expect(current_path).to eq("/boats/#{@hobie.id}")
      expect(page).to have_content('Tracker')
    end
  end
end
