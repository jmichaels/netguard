# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_01_172739) do

  create_table "devices", force: :cascade do |t|
    t.string "hostname"
    t.string "ip_address"
    t.string "category"
    t.string "manufacturer"
    t.string "mac_address"
    t.string "operating_system"
    t.string "operating_system_version"
    t.decimal "memory_total_gb"
    t.decimal "memory_used_gb"
    t.decimal "storage_capacity_tb"
    t.decimal "storage_used_tb"
    t.string "processor_name"
    t.integer "processor_cores"
    t.integer "processor_threads"
    t.decimal "processor_clock_speed_ghz"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organization_devices", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "device_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_organization_devices_on_device_id"
    t.index ["organization_id"], name: "index_organization_devices_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "outage_reports", force: :cascade do |t|
    t.string "category"
    t.integer "device_id", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_outage_reports_on_device_id"
  end

  create_table "special_device_list_devices", force: :cascade do |t|
    t.integer "special_device_list_id", null: false
    t.integer "device_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_special_device_list_devices_on_device_id"
    t.index ["special_device_list_id"], name: "index_special_device_list_devices_on_special_device_list_id"
  end

  create_table "special_device_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_devices", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "device_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_user_devices_on_device_id"
    t.index ["user_id"], name: "index_user_devices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "employee_id"
    t.string "email_address"
    t.integer "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  create_table "vulnerability_scan_results", force: :cascade do |t|
    t.integer "device_id", null: false
    t.datetime "scanned_at"
    t.integer "threat_level"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ip_address"
    t.index ["device_id"], name: "index_vulnerability_scan_results_on_device_id"
  end

  add_foreign_key "organization_devices", "devices"
  add_foreign_key "organization_devices", "organizations"
  add_foreign_key "outage_reports", "devices"
  add_foreign_key "special_device_list_devices", "devices"
  add_foreign_key "special_device_list_devices", "special_device_lists"
  add_foreign_key "user_devices", "devices"
  add_foreign_key "user_devices", "users"
  add_foreign_key "users", "organizations"
  add_foreign_key "vulnerability_scan_results", "devices"
end
