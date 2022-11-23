# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_19_024855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delivery_contents", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "truck_id"
    t.date "delivery_date"
    t.string "consignor"
    t.string "departure_place"
    t.bigint "delivery_destination_id"
    t.integer "distance"
    t.integer "loading_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_destination_id"], name: "index_delivery_contents_on_delivery_destination_id"
    t.index ["truck_id"], name: "index_delivery_contents_on_truck_id"
    t.index ["user_id"], name: "index_delivery_contents_on_user_id"
  end

  create_table "delivery_destinations", force: :cascade do |t|
    t.string "delivery_destination_name"
    t.string "delivery_destination_address"
    t.string "commercial_distribution"
    t.integer "post_code"
    t.time "time_from"
    t.time "time_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loads", force: :cascade do |t|
    t.integer "load_number"
    t.string "material"
    t.bigint "delivery_content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delivery_content_id"], name: "index_loads_on_delivery_content_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.integer "truck_number"
    t.integer "load_capacity"
    t.integer "carrier"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trucks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "user_type"
    t.string "driver_office"
    t.string "driver_license"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "delivery_contents", "delivery_destinations"
  add_foreign_key "delivery_contents", "trucks"
  add_foreign_key "delivery_contents", "users"
  add_foreign_key "loads", "delivery_contents"
  add_foreign_key "trucks", "users"
end
