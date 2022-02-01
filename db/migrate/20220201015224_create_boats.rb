class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :crew_size
      t.boolean :motor_powered
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
