class AddDockToBoats < ActiveRecord::Migration[5.2]
  def change
    add_reference :boats, :dock, foreign_key: true
  end
end
