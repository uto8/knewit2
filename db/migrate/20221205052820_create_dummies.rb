class CreateDummies < ActiveRecord::Migration[5.2]
  def change
    create_table :dummies do |t|
      t.references :user, foreign_key: true
      t.references :truck, foreign_key: true
      t.date :delivery_date
      t.string :consignor
      t.string :departure_place
      t.references :delivery_destination, foreign_key: true
      t.integer :distance
      t.integer :loading_weight

      t.timestamps
    end
  end
end
