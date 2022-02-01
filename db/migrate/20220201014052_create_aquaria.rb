class CreateAquaria < ActiveRecord::Migration[5.2]
  def change
    create_table :aquaria do |t|
      t.string :name
      t.boolean :clean
      t.integer :number_of_types
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
