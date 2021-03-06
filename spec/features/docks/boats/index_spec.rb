require "rails_helper"

RSpec.describe 'Docks boats index' do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
    @hobie = @baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
    visit "/docks/#{@baltimore.id}/boats"
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
    click_on('All Boats')
    expect(page).to have_current_path('/boats')
  end

  scenario "visitor clicks link and go to dock index" do
    click_link('All Docks')
    expect(page).to have_current_path('/docks')
  end

  scenario "visitor clicks link and sorts in alphabetical order" do
    expect(@sea_ray.name).to appear_before(@hobie.name)

    click_on('Order Alphabetically')

    expect(page).to have_current_path("/docks/#{@baltimore.id}/boats?sort=asc")
    expect(@hobie.name).to appear_before(@sea_ray.name)
  end

  scenario "visitor clicks link and edits that childs info" do
    click_link("Edit #{@sea_ray.name}")
    expect(page).to have_current_path("/boats/#{@sea_ray.id}/edit")
  end

  scenario "visitor fills form and returns to filtered index" do
    expect(page).to have_content(@hobie.name)
    expect(page).to have_content(@sea_ray.name)

    fill_in('number', with: 2)
    click_on("of crew size")

    expect(page).to_not have_content(@hobie.name)
    expect(page).to have_content(@sea_ray.name)
  end
end
