# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ドライバー作成
5.times do |n|
  User.create!(
    name: "ドライバー#{n}",
    email: "driver#{n}@gmail.com",
    password: "password",
    user_type: 1
  )
end

# トラック作成
5.times do |n|
  Truck.create!(
    truck_number: 1234 + n,
    load_capacity: 2000 + n * 1000,
  )
end

# 配送データ作成
5.times do |n|
  DeliveryData.create!(
    user: User.find_by(name: "ドライバー#{n}"),
    truck: Truck.find_by(truck_number: 1234 + n),
    delivery_date: 20220826,
    consignor: "豊田通商#{n}"
  )
end

# 配送ルート作成
5.times do |n|
  DeliveryRoot.create!(
    departure_place: "weworkグローバルゲート",
    destination: "恵比寿ガーデンプレイス",
    delivery_data: DeliveryData.find_by(consignor: "豊田通商#{n}")
  )
end

# 荷物データ作成
5.times do |n|
  Load.create!(
    load_number: 1111 + n,
    material: "鉄",
    laod_weight: 1000 + n * 1000,
    delivery_data: DeliveryData.find_by(consignor: "豊田通商#{n}")
  )
end
