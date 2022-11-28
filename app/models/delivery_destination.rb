class DeliveryDestination < ApplicationRecord
  has_many :delivery_contents

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(0)

    (4..spreadsheet.last_row).each do |i|
      records = spreadsheet.row(i)
      puts records
      DeliveryDestination.create!(
        delivery_destination_name: records[10],
        delivery_destination_address: records[14],
        commercial_distribution: records[12],
        post_code: records[13],
        time_from: records[21],
        time_to: records[22],
        is_lift: records[31],
        is_slinging: records[32],
        is_chaburi: records[33],
        description: records[41],
        car_size: records[29],
      )
    end
  end
end
