class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.string :load_number
      t.string :material
      t.integer :loads_count
      t.integer :weight
      t.integer :total_weight
      t.string :packing
      t.date :date
      t.string :delivery_destination
      t.string :user

      t.timestamps
    end
  end
end
