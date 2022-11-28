class Truck < ApplicationRecord
  has_many :delivery_contents
  enum carrier: { wing: 0, body: 1 }
  belongs_to :user

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(0)

    (3..spreadsheet.last_row).each do |i|
      records = spreadsheet.row(i)
      puts records
      Truck.create!(
        truck_number: records[3],
        load_capacity: records[8],
        carrier: records[7],
        # user: User.find_by(name: records[16])
      )
    end
  end
end
