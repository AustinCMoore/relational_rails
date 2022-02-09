require 'rails_helper'

RSpec.describe 'delete fish record' do
  scenario 'visitor sees link to delete a fish' do

    @shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
    @angler = @shedd.fish.create!(name: 'Anglerfish', bioluminescent: true, quantity: 10)
    visit "/fish/#{@angler.id}"
    
    click_link "Delete Fish"
    expect(current_path).to eq("/fish")
    expect(page).to_not have_content(@angler.name)
  end
end