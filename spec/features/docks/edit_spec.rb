require "rails_helper"

RSpec.describe 'New Dock' do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @new_york = Dock.create!(name: 'NYC Dock', open: true, capacity: 30)
    @savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)
  end
  describe 'When a visitor visits the edit dock form by clicking a link on the show' do
    it 'links to the edit page from the docks show page' do
      visit "/docks/#{@baltimore.id}"
      click_on "Edit #{@baltimore.name}"
      expect(current_path).to eq("/docks/#{@baltimore.id}/edit")
    end

    it "can edit the docks" do
      visit "/docks/#{@baltimore.id}/edit"

      fill_in('Name', with: 'Houston')
      fill_in('Open', with: 'true')
      fill_in('Capacity', with: '5')

      click_button 'Update Dock'

      expect(current_path).to eq("/docks/#{@baltimore.id}")
      expect(page).to have_content('Houston')
    end
  end
end
