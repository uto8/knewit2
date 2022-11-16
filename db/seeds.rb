#ドライバー作成
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
    car_size: n + 5,
    carrier: 1
  )
end
# 配送データ作成
5.times do |n|
  DeliveryContent.create!(
    user: User.find_by(email: "driver#{n}@gmail.com"),
    truck: Truck.find_by(truck_number: 1234 + n),
    delivery_date: 20220826,
    consignor: "豊田通商#{n}"
  )
end

# 配送ルート作成
5.times do |n|
  DeliveryRoot.create!(
    departure_place: "weworkグローバルゲート#{n}",
    destination: "恵比寿ガーデンプレイス",
    delivery_content: DeliveryContent.find_by(consignor: "豊田通商#{n}"),
    distance: 3000 + n * 1000
  )
end

# 荷物データ作成
5.times do |n|
  Load.create!(
    load_number: 1111 + n,
    material: "鉄",
    load_weight: 1000 + n * 1000,
    delivery_root: DeliveryRoot.find_by(departure_place: "weworkグローバルゲート#{n}")
  )
end
