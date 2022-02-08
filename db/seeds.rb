# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Aquarium.destroy_all
# Dock.destroy_all
# Fish.destroy_all
# Boat.destroy_all

shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)
nyc = Aquarium.create!(name: 'New York Aquarium', clean: true, number_of_types: 150)

nemo = shedd.fish.create!(name: 'Clownfish', bioluminescent: false, quantity: 70)
dory = shedd.fish.create!(name: 'Regal Tang', bioluminescent: false, quantity: 60)
angler = shedd.fish.create!(name: 'Angerfish', bioluminescent: true, quantity: 20)
bubbles = denver.fish.create!(name: 'Yellow Tang', bioluminescent: false, quantity: 50)
gurgle = denver.fish.create!(name: 'Royal Gramma', bioluminescent: false, quantity: 60)
bloat = denver.fish.create!(name: 'Pufferfish', bioluminescent: false, quantity: 40)
deb = national.fish.create!(name: 'Four-Stripe Damselfish', bioluminescent: false, quantity: 30)
gill = national.fish.create!(name: 'Moorish Idol', bioluminescent: false, quantity: 40)
bruce = national.fish.create!(name: 'Great White Shark', bioluminescent: false, quantity: 10)


baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
new_york = Dock.create!(name: 'NYC Dock', open: false, capacity: 30)
savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)

hobie = baltimore.boats.create!(name: 'Hobie', motor_powered: false, crew_size: 2)
sea_ray = baltimore.boats.create!(name: 'Sea Ray', motor_powered: true, crew_size: 3)
