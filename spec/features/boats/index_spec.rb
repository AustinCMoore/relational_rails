require "rails_helper"

RSpec.describe "boats index page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
  end

  scenario "visitor sees each child in the system including their attributes" do
    visit '/boats'

    expect(current_path).to eq('/boats')
    expect(page).to have_content(@sea_ray.name)
    expect(page).to have_content(@sea_ray.motor_powered)
    expect(page).to have_content(@sea_ray.crew_size)
  end

  scenario "visitor clicks link and go to boat index" do
    visit '/boats'

    click_link('All Boats')
    expect(page).to have_current_path('/boats')
  end

  scenario "visitor clicks link and go to dock index" do
    visit '/boats'

    click_link('All Docks')
    expect(page).to have_current_path('/docks')
  end

  scenario "visitor only see records where boolean column is true" do
    visit '/boats'

    expect(page).to have_no_content(@hobie.name)
    expect(page).to have_no_content(@hobie.motor_powered)
    expect(page).to have_no_content(@hobie.crew_size)

    expect(page).to have_content(@sea_ray.name)
    expect(page).to have_content(@sea_ray.motor_powered)
    expect(page).to have_content(@sea_ray.crew_size)
  end
end
