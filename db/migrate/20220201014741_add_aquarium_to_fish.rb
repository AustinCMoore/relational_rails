class AddAquariumToFish < ActiveRecord::Migration[5.2]
  def change
    add_reference :fish, :aquarium, foreign_key: true
  end
end
