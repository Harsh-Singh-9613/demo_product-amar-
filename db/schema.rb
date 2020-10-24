# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20201023131542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.date    "date"
    t.string  "status"
    t.integer "employee_id"
  end

  add_index "attendances", ["employee_id"], name: "index_attendances_on_employee_id", using: :btree

  create_table "employee_payment_records", force: :cascade do |t|
    t.date    "date"
    t.integer "amount"
    t.string  "description"
    t.boolean "is_settled"
    t.integer "employee_id"
  end

  add_index "employee_payment_records", ["employee_id"], name: "index_employee_payment_records_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string  "name"
    t.integer "license_number"
    t.integer "adhaar_number"
    t.integer "mobile_number"
    t.integer "salary"
    t.string  "designation"
    t.boolean "is_working"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.integer  "default_truck_capacity"
    t.integer  "lnt_basic_charge"
    t.string   "lnt_leading_charge"
    t.integer  "excavation_charges"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trip_records", force: :cascade do |t|
    t.date     "trip_date"
    t.integer  "trip_count"
    t.integer  "distance"
    t.integer  "revenue"
    t.integer  "truck_capacity"
    t.integer  "diesel_quatity"
    t.integer  "diesel_price"
    t.string   "chainage"
    t.integer  "site_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "excavation_done",               default: true
    t.boolean  "loading_and_trasportaion_done", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "mobile_no"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "attendances", "employees"
  add_foreign_key "employee_payment_records", "employees"
end
