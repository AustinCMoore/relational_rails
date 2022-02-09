RSpec.describe 'destroying a dock' do
  it "can delete the dock from the index page" do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)

    visit "/docks/#{@baltimore.id}"
    expect(page).to have_content(@baltimore.name)

    click_link("Delete Dock")

    expect(current_path).to eq("/docks")
    expect(page).to_not have_content(@baltimore.name)
  end

  scenario "visitor clicks link and deletes a parent from the index page" do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @new_york = Dock.create!(name: 'NYC Dock', open: false, capacity: 30)
    @savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)

    visit '/docks'

    expect(page).to have_content(@baltimore.name)
    expect(page).to have_content(@new_york.name)
    expect(page).to have_content(@savannah.name)

    click_link("Delete #{@baltimore.name}")

    expect(current_path).to eq("/docks")
    expect(page).to have_content(@new_york.name)
    expect(page).to have_content(@savannah.name)
    expect(page).to_not have_content(@baltimore.name)
  end
end
