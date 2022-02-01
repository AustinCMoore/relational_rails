class CreateDocks < ActiveRecord::Migration[5.2]
  def change
    create_table :docks do |t|
      t.string :name
      t.boolean :open
      t.integer :capacity
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
