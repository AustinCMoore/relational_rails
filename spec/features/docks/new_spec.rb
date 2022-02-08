require "rails_helper"

RSpec.describe 'New Dock' do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @new_york = Dock.create!(name: 'NYC Dock', open: true, capacity: 30)
    @savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)
  end
  describe 'When I visit the new dock form by clicking a link on the index' do
    it 'links to the new page from the docks index' do
      visit '/docks'
      click_on 'New Dock'
      expect(current_path).to eq('/docks/new')
    end

    it 'can create a new dock and lists it on index page' do
      visit '/docks/new'

      fill_in('Name', with: 'Houston')
      fill_in('Open', with: true)
      fill_in('Capacity', with: 5)
      click_on 'Create Dock'
      expect(current_path).to eq('/docks')
      expect(page).to have_content('Houston')
    end
  end
end
