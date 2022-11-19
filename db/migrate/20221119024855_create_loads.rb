class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.integer :load_number
      t.string :material
      t.references :delivery_content, foreign_key: true

      t.timestamps
    end
  end
end
