require "rails_helper"

RSpec.describe "boats index page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: true, crew_size: 2)
  end

  scenario "visitor sees each child in the system including their attributes" do
    visit '/boats'

    expect(current_path).to eq('/boats')
    expect(page).to have_content(@hobie.name)
    expect(page).to have_content(@hobie.motor_powered)
    expect(page).to have_content(@hobie.crew_size)
  end

  scenario "visitor clicks link and go to boat index" do
    visit '/boats'
    
    click_link('All Boats')
    expect(page).to have_current_path('/boats')
  end
end
