class DeliveryContent < ApplicationRecord
  belongs_to :user
  belongs_to :truck
  belongs_to :delivery_destination
  has_many :loads

  require 'csv'


  def self.import(file)
    # spreadsheet = open_spreadsheet(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(0)
    # spreadsheet.row(n) でn行めの内容が配列として取得できる
    # エクセル以外のソフトからelsxの書き出しをした場合等は先頭行の形式に注意する

    (2..spreadsheet.last_row).each do |i|
      records = spreadsheet.row(i)
      puts records
      DeliveryContent.create!(
        user: User.find_by(name: records[0]),
        truck: Truck.find_by(truck_number: records[1]),
        delivery_date: records[2],
        consignor: records[3],
        departure_place: records[4],
        delivery_destination: DeliveryDestination.find_by(delivery_destination_name: records[5]),
        distance: records[6],
        loading_weight: records[7]
      )
    end
  end
end
