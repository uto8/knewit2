class CreateCo2Emissions < ActiveRecord::Migration[5.2]
  def change
    create_table :co2_emissions do |t|
      t.date :date
      t.string :division
      t.integer :emission

      t.timestamps
    end
  end
end
