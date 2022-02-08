require "rails_helper"

RSpec.describe 'Docks boats index' do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
  end

  scenario "visitor sees boats associated w that dock w each boats attributes" do
    visit "/docks/#{@baltimore.id}/boats"

    expect(current_path).to eq("/docks/#{@baltimore.id}/boats")
    expect(page).to have_content(@hobie.name)
    expect(page).to have_content(@hobie.motor_powered)
    expect(page).to have_content(@hobie.crew_size)
    expect(page).to have_content(@sea_ray.name)
    expect(page).to have_content(@sea_ray.motor_powered)
    expect(page).to have_content(@sea_ray.crew_size)
  end

  scenario "visitor clicks link and go to boat index" do
    visit "/docks/#{@baltimore.id}/boats"

    click_on('All Boats')
    expect(page).to have_current_path('/boats')
  end

  scenario "visitor clicks link and go to dock index" do
    visit "/docks/#{@baltimore.id}/boats"

    click_link('All Docks')
    expect(page).to have_current_path('/docks')
  end
end
