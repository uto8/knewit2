class CreateDeliveryData < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_data do |t|
      t.references :user, foreign_key: true
      t.references :truck, foreign_key: true
      t.date :delivery_date
      t.string :consignor

      t.timestamps
    end
  end
end
