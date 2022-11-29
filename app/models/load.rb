class Load < ApplicationRecord
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
      Load.create!(
        date: records[0],
        delivery_destination: records[1],
        user: records[2],
        load_number: records[3],
        material: records[4],
        loads_count: records[6],
        weight: records[7],
        total_weight: records[8],
        packing: records[5]
      )
    end
  end
end
