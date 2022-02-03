require "rails_helper"

RSpec.describe "docks index page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @new_york = Dock.create!(name: 'NYC Dock', open: true, capacity: 30)
    @savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)
  end

  scenario "visitor sees name of each parent record" do
    visit '/docks'

    expect(current_path).to eq('/docks')
    expect(page).to have_content(@baltimore.name)
    expect(page).to have_content(@new_york.name)
    expect(page).to have_content(@savannah.name)
  end
end
