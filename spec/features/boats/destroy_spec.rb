RSpec.describe 'destroying a boat' do
  it "can delete the boat from the show page" do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)

    visit "/boats/#{@sea_ray.id}"
    click_link("Delete Boat")

    expect(current_path).to eq("/boats")
    expect(page).to_not have_content(@sea_ray.name)
  end

  it "can delete the boat from the boat index page" do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)

    visit '/boats'

    expect(page).to have_content(@sea_ray.name)

    click_link("Delete #{@sea_ray.name}")

    expect(current_path).to eq("/boats")
    expect(page).to_not have_content(@sea_ray.name)
  end

  it "can delete the boat from the boat index page" do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @sea_ray = @baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)

    visit "/docks/#{@baltimore.id}/boats"

    expect(page).to have_content(@sea_ray.name)

    click_link("Delete #{@sea_ray.name}")

    expect(current_path).to eq("/boats")
    expect(page).to_not have_content(@sea_ray.name)
  end
end
