require "rails_helper"

RSpec.describe "boats index page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: true, crew_size: 2)
  end

  scenario "visitor sees the child with that id and its attributes" do
    visit "/boats/#{@hobie.id}"

    expect(current_path).to eq("/boats/#{@hobie.id}")
    expect(page).to have_content(@hobie.name)
    expect(page).to have_content(@hobie.motor_powered)
    expect(page).to have_content(@hobie.crew_size)
  end

  scenario "visitor clicks link and go to boat index" do
    visit "/boats/#{@hobie.id}"

    click_link('All Boats')
    expect(page).to have_current_path('/boats')
  end

  scenario "visitor clicks link and go to dock index" do
    visit "/boats/#{@hobie.id}"

    click_link('All Docks')
    expect(page).to have_current_path('/docks')
  end
end
