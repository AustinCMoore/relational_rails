require "rails_helper"

RSpec.describe 'Create Child' do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
  end
  
  describe 'A visitor can add a new boat to the dock boats index' do
    it 'links to the new page from the docks boats index' do
      visit "/docks/#{@baltimore.id}/boats"
      click_on 'Create Boat'
      expect(current_path).to eq("/docks/#{@baltimore.id}/boats/new")
    end

    it 'can create a new dock and lists it on index page' do
      visit "/docks/#{@baltimore.id}/boats/new"

      fill_in('Name', with: 'Tracker')
      fill_in('motor_powered', with: true)
      fill_in('crew_size', with: 5)
      click_on 'Create Boat'
      expect(current_path).to eq("/docks/#{@baltimore.id}/boats")
      expect(page).to have_content('Tracker')
    end
  end
end
