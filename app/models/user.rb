class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: { admin: 0, driver: 1, manager: 2, consignor_manager: 3, consignor_worker: 4 }
  enum driver_license: { large: 0, middle: 1, unknown: 2 }

  has_many :delivery_contents

  has_one :truck

  def self.import(file)
    # spreadsheet = open_spreadsheet(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(0)
    # spreadsheet.row(n) でn行めの内容が配列として取得できる
    # エクセル以外のソフトからelsxの書き出しをした場合等は先頭行の形式に注意する

    (3..spreadsheet.last_row).each do |i|
      records = spreadsheet.row(i)
      puts records
      User.create!(
        name: records[4],
        email: records[27],
        password: records[28],
        user_type: 1,
        driver_office: records[3],
        driver_license: records[8]
      )
    end
  end
end
