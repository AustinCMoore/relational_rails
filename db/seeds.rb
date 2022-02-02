# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shedd = Aquarium.create!(name: 'Shedd Aquarium', clean: true, number_of_types: 100)
national = Aquarium.create!(name: 'The National Aquarium', clean: true, number_of_types: 200)
denver = Aquarium.create!(name: 'Denver Aquarium', clean: true, number_of_types: 50)

baltimore = Dock.create!(name: 'Baltimore Dock', open: true, capacity: 20)
new_york = Dock.create!(name: 'NYC Dock', open: true, capacity: 30)
savannah = Dock.create!(name: 'Savannah Dock', open: true, capacity: 10)