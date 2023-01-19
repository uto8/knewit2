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
User.create!(
  name:"神田",
  email: "kanda@gmail.com",
  password: "password",
  user_type: 1,
  driver_office: "豊中倉庫/名古屋",
  driver_license: 0,
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
Truck.create!(
  truck_number: 7287,
  load_capacity: 4000,
  carrier: 1,
  width: 2350,
  height: 400,
  length: 6150,
  is_stanchion: true,
  truck_office: "豊中倉庫/つばさ",
  user_id: User.find_by(name: "吉").id
)
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
Truck.create!(
  truck_number: 1111,
  load_capacity: 3000,
  carrier: 1,
  width: 2160,
  height: 370,
  length: 4350,
  is_stanchion: false,
  truck_office: "豊中倉庫/名古屋",
  user_id: User.find_by(name: "神田").id
)

Co2Emission.create!(
  [
    {
      date: "2022/1/12",
      division: "事業部A",
      emission: "42"
    },
    {
      date: "2022/1/12",
      division: "事業部B",
      emission: "51"
    },
    {
      date: "2022/1/21",
      division: "事業部A",
      emission: "35"
    },
    {
      date: "2022/1/21",
      division: "事業部B",
      emission: "78"
    },
    {
      date: "2022/1/30",
      division: "事業部A",
      emission: "16"
    },
    {
      date: "2022/1/30",
      division: "事業部B",
      emission: "67"
    },
    {
      date: "2022/2/7",
      division: "事業部A",
      emission: "49"
    },
    {
      date: "2022/2/7",
      division: "事業部B",
      emission: "81"
    },
    {
      date: "2022/2/15",
      division: "事業部A",
      emission: "12"
    },
    {
      date: "2022/2/15",
      division: "事業部B",
      emission: "35"
    },
    {
      date: "2022/3/7",
      division: "事業部A",
      emission: "42"
    },
    {
      date: "2022/3/7",
      division: "事業部B",
      emission: "51"
    },
    {
      date: "2022/4/1",
      division: "事業部A",
      emission: "67"
    },
    {
      date: "2022/4/1",
      division: "事業部B",
      emission: "102"
    },
    {
      date: "2022/4/25",
      division: "事業部A",
      emission: "42"
    },
    {
      date: "2022/4/25",
      division: "事業部B",
      emission: "51"
    },
    {
      date: "2022/5/15",
      division: "事業部A",
      emission: "12"
    },
    {
      date: "2022/5/15",
      division: "事業部B",
      emission: "35"
    },
    {
      date: "2022/6/9",
      division: "事業部A",
      emission: "57"
    },
    {
      date: "2022/6/9",
      division: "事業部B",
      emission: "78"
    }
  ]
)
