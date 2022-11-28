# # 各種類のユーザー作成
User.create(
  name: "管理者",
  email: "admin@gmail.com",
  password: "password",
  user_type: 0
)
User.create(
  name: "経営者",
  email: "manager@gmail.com",
  password: "password",
  user_type: 2
)
User.create(
  name: "荷主経営者",
  email: "consignormanager@gmail.com",
  password: "password",
  user_type: 3
)
User.create(
  name: "荷主労働者",
  email: "consignorworker@gmail.com",
  password: "password",
  user_type: 4
)

User.create!(
  name:"薄田",
  email: "usuda@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/つばさ",
  driver_license: 0,
  is_slinging: true,
  is_lift: true,
  is_chaburi: false
)
User.create!(
  name:"吉",
  email: "kiti@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/つばさ",
  driver_license: 1,
  is_slinging: true,
  is_lift: true,
  is_chaburi: false
)
User.create!(
  name:"古川",
  email: "hurukawa@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/つばさ",
  driver_license: 1,
  is_slinging: true,
  is_lift: true,
  is_chaburi: false
)
User.create!(
  name:"鬼頭",
  email: "kitou@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/名古屋",
  driver_license: 2,
  is_slinging: true,
  is_lift: false,
  is_chaburi: false
)
User.create!(
  name:"伊藤",
  email: "ito@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/名古屋",
  driver_license: 2,
  is_slinging: true,
  is_lift: false,
  is_chaburi: false
)
User.create!(
  name:"川崎",
  email: "kawasaki@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/名古屋",
  driver_license: 2,
  is_slinging: true,
  is_lift: false,
  is_chaburi: false
)
User.create!(
  name:"廣田",
  email: "hirota@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/名古屋",
  driver_license: 2,
  is_slinging: true,
  is_lift: false,
  is_chaburi: false
)
User.create!(
  name:"磯部",
  email: "isobe@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/名古屋",
  driver_license: 2,
  is_slinging: true,
  is_lift: false,
  is_chaburi: false
)

Truck.create!(
  truck_number: 4943,
  load_capacity: 10000,
  carrier: 1,
  width: 2420,
  height: 600,
  length: 7600,
  is_stanchion: true,
  truck_office: "豊中倉庫/つばさ",
  user_id: User.find_by(name: "薄田").id
)
# Truck.create!(
#   truck_number: 7287,
#   load_capacity: 4000,
#   carrier: 1,
#   width: 2350,
#   height: 400,
#   length: 6150,
#   is_stanchion: true,
#   truck_office: "豊中倉庫/つばさ",
#   user_id: User.find_by(name: "吉").id
# )
Truck.create!(
  truck_number: 3076,
  load_capacity: 3300,
  carrier: 1,
  width: 2150,
  height: 800,
  length: 5770,
  is_stanchion: true,
  truck_office: "豊中倉庫/つばさ",
  user_id: User.find_by(name: "古川").id
)
Truck.create!(
  truck_number: 5095,
  load_capacity: 3600,
  carrier: 1,
  width: 2120,
  height: 410,
  length: 6020,
  is_stanchion: true,
  truck_office: "豊中倉庫/名古屋",
  user_id: User.find_by(name: "鬼頭").id
)
Truck.create!(
  truck_number: 6079,
  load_capacity: 3500,
  carrier: 1,
  width: 2120,
  height: 370,
  length: 6020,
  is_stanchion: true,
  truck_office: "豊中倉庫/名古屋",
  user_id: User.find_by(name: "伊藤").id
)
Truck.create!(
  truck_number: 6098,
  load_capacity: 3100,
  carrier: 1,
  width: 2120,
  height: 370,
  length: 6020,
  is_stanchion: true,
  truck_office: "豊中倉庫/名古屋",
  user_id: User.find_by(name: "川崎").id
)
Truck.create!(
  truck_number: 6092,
  load_capacity: 3200,
  carrier: 1,
  width: 2150,
  height: 400,
  length: 6080,
  is_stanchion: true,
  truck_office: "豊中倉庫/名古屋",
  user_id: User.find_by(name: "廣田").id
)
Truck.create!(
  truck_number: 2159,
  load_capacity: 1900,
  carrier: 1,
  width: 2160,
  height: 370,
  length: 4350,
  is_stanchion: false,
  truck_office: "豊中倉庫/名古屋",
  user_id: User.find_by(name: "磯部").id
)
# 配送データ作成
80.times do |n|
  DeliveryContent.create!(
    user: User.find_by(name: "薄田"),
    truck: Truck.find_by(truck_number: 4943),
    delivery_date: 20220826,
    consignor: "豊田通商#{n}",
    delivery_destination: DeliveryDestination.find(1),
    distance: 2000 + n * 1000,
    loading_weight: 100 + n * 100
  )
end
