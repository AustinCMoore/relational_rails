require "rails_helper"

RSpec.describe "boats index page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
    visit "/boats/#{@hobie.id}"
  end

  scenario "visitor sees the child with that id and its attributes" do
    expect(current_path).to eq("/boats/#{@hobie.id}")
    expect(page).to have_content(@hobie.name)
    expect(page).to have_content(@hobie.motor_powered)
    expect(page).to have_content(@hobie.crew_size)
  end

  scenario "visitor clicks link and go to boat index" do
    click_link('All Boats')
    expect(page).to have_current_path('/boats')
  end

  scenario "visitor clicks link and go to dock index" do
    click_link('All Docks')
    expect(page).to have_current_path('/docks')
  end
end
