require "rails_helper"

RSpec.describe "docks index page", type: :feature do
  before(:each) do
    @baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
    @new_york = Dock.create!(name: 'NYC Dock', open: false, capacity: 30)
    @savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)
    visit '/docks'

  end

  scenario "visitor sees name of each parent record" do
    expect(current_path).to eq('/docks')
    expect(page).to have_content(@baltimore.name)
    expect(page).to have_content(@new_york.name)
    expect(page).to have_content(@savannah.name)
  end

  scenario "visitor sees records ordered by most recent first with timestamps" do
    within('#dock-0') do
      expect(page).to have_content(@savannah.name)
      expect(page).to have_content(@savannah.created_at)
    end

    within('#dock-1') do
      expect(page).to have_content(@new_york.name)
      expect(page).to have_content(@new_york.created_at)
    end

    within('#dock-2') do
      expect(page).to have_content(@baltimore.name)
      expect(page).to have_content(@baltimore.created_at)
    end
  end

  scenario "visitor clicks link and go to boat index" do
    click_link('All Boats')
    expect(page).to have_current_path('/boats')
  end

  scenario "visitor clicks link and go to dock index" do
    click_link('All Docks')
    expect(page).to have_current_path('/docks')
  end

  scenario "visitor clicks link and edits that parents info" do
    click_link("Edit #{@baltimore.name}")
    expect(page).to have_current_path("/docks/#{@baltimore.id}/edit")
  end
end
