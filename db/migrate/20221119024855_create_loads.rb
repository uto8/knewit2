class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.integer :load_number
      t.string :material
      t.references :delivery_content, foreign_key: true
      t.integer :loads_count
      t.integer :weight
      t.integer :total_weight
      t.string :packing

      t.timestamps
    end
  end
end
