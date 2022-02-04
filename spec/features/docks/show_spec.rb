require "rails_helper"

RSpec.describe "docks index page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @new_york = Dock.create!(name: 'NYC Dock', open: true, capacity: 30)
    @savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)
  end

  scenario "visitor sees the parent with that id and its attributes" do
    visit "/docks/#{@baltimore.id}"
    expect(page).to have_content(@baltimore.name)
    expect(page).to have_content(@baltimore.capacity)
    expect(page).to have_content(@baltimore.open)
  end
end
