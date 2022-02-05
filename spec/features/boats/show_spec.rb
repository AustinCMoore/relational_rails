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
    save_and_open_page
  end
end
