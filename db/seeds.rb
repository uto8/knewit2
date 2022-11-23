# 各種類のユーザー作成
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

#ドライバー作成
5.times do |n|
  User.create!(
    name: "ドライバー#{n}",
    email: "driver#{n}@gmail.com",
    password: "password",
    user_type: 1,
    driver_office: "営業所#{n}"
  )
end

# トラック作成
# 5.times do |n|
#   Truck.create!(
#     truck_number: 1234 + n,
#     load_capacity: 2000 + n * 1000,
#     car_size: n + 5,
#     carrier: 1,
#     car_weight: n * 1000
#   )
# end

# #納入先情報
# 5.times do |n|
#   DeliveryDestination.create!(
#     delivery_destination_name: "納入先#{n}",
#     delivery_destination_address: "愛知県名古屋市瑞穂区",
#     commercial_distribution: "商流#{n}"
#   )
# end

# # 配送データ作成
# 5.times do |n|
#   DeliveryContent.create!(
#     user: User.find_by(email: "driver#{n}@gmail.com"),
#     truck: Truck.find_by(truck_number: 1234 + n),
#     delivery_date: 20220826,
#     consignor: "豊田通商#{n}",
#     delivery_destination: DeliveryDestination.find_by(delivery_destination_name: "納入先#{n}"),
#     distance: 2000 + n * 1000,
#     loading_weight: 100 + n * 100
#   )
# end


# # 荷物データ作成
# 5.times do |n|
#   Load.create!(
#     load_number: 1111 + n,
#     material: "鉄",
#     delivery_content: DeliveryContent.find_by(consignor: "豊田通商#{n}")
#   )
# end
