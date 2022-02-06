require "rails_helper"

RSpec.describe "docks show page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @new_york = Dock.create!(name: 'NYC Dock', open: true, capacity: 30)
    @savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)
  end

  scenario "visitor sees the parent with that id and its attributes" do
    visit "/docks/#{@baltimore.id}"

    expect(current_path).to eq("/docks/#{@baltimore.id}")
    expect(page).to have_content(@baltimore.name)
    expect(page).to have_content(@baltimore.capacity)
    expect(page).to have_content(@baltimore.open)
  end

  scenario "visitor sees a count of that parents children" do
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: true, crew_size: 2)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
    visit "/docks/#{@baltimore.id}"

    expect(page).to have_content("current boat qty: 2")
  end

  scenario "visitor clicks link and go to boat index" do
    visit "/docks/#{@baltimore.id}"
    
    click_link('All Boats')
    expect(page).to have_current_path('/boats')
  end
end
