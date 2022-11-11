class CreateDeliveryRoots < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_roots do |t|
      t.string :departure_place
      t.string :destination
      t.references :delivery_data, foreign_key: true
      t.integer :distance

      t.timestamps
    end
  end
end
