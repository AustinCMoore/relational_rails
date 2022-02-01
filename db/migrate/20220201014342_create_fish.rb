class CreateFish < ActiveRecord::Migration[5.2]
  def change
    create_table :fish do |t|
      t.string :name
      t.boolean :bioluminescent
      t.integer :quantity
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
