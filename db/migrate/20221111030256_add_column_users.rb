class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :user_type, :integer
    add_column :users, :driver_office, :string
    add_column :users, :driver_license, :string
  end
end
