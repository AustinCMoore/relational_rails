RSpec.describe 'destroying a dock' do
  it "can delete the dock from the index page" do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)

    visit "/docks/#{@baltimore.id}"
    click_link("Delete Dock")

    expect(current_path).to eq("/docks")
    expect(page).to_not have_content(@baltimore.name)
  end
end
