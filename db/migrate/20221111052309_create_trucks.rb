class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.integer :truck_number
      t.integer :load_capacity
      t.integer :carrier
      t.integer :car_size

      t.timestamps
    end
  end
end
