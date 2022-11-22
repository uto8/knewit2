class CreateDeliveryDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_destinations do |t|
      t.string :delivery_destination_name
      t.string :delivery_destination_address
      t.string :commercial_distribution
      t.integer :post_code
      t.time :time_from
      t.time :time_to

      t.timestamps
    end
  end
end
