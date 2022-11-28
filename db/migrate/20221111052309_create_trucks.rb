class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.integer :truck_number
      t.integer :load_capacity
      t.integer :carrier
      t.references :user, foreign_key: true
      t.integer :width
      t.integer :height
      t.integer :length
      t.boolean :is_stanchion
      t.string :truck_office
      t.text :description

      t.timestamps
    end
  end
end
