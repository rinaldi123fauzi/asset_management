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

ActiveRecord::Schema.define(version: 2023_03_23_225654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approvals", force: :cascade do |t|
    t.bigint "loan_id"
    t.string "approve_by"
    t.integer "approve_level"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_id"], name: "index_approvals_on_loan_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "id_pegawai"
    t.string "nama"
    t.string "tempat_lahir"
    t.date "tanggal_lahir"
    t.string "alamat"
    t.string "id_identitas"
    t.string "nomor_telepon"
    t.string "email"
    t.string "jabatan"
    t.bigint "work_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_unit_id"], name: "index_employees_on_work_unit_id"
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "software_id"
    t.bigint "tool_id"
    t.string "deskripsi"
    t.integer "jumlah"
    t.date "from_date"
    t.date "to_date"
    t.string "penanggung_jawab"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["software_id"], name: "index_loans_on_software_id"
    t.index ["tool_id"], name: "index_loans_on_tool_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_assignments_on_role_id"
    t.index ["user_id"], name: "index_role_assignments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.text "permissions"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "softwares", force: :cascade do |t|
    t.string "nomor_serial"
    t.string "nama"
    t.string "kategori"
    t.string "license_by"
    t.string "expired_date"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_softwares_on_vendor_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "software_id"
    t.bigint "tool_id"
    t.integer "jumlah"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["software_id"], name: "index_stocks_on_software_id"
    t.index ["tool_id"], name: "index_stocks_on_tool_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "nomor_serial"
    t.string "nama"
    t.string "kategori"
    t.string "sifat"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_tools_on_vendor_id"
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
    t.string "username"
    t.boolean "state", default: true
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "nama"
    t.string "alamat"
    t.string "kategori"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_units", force: :cascade do |t|
    t.string "nama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "approvals", "loans"
  add_foreign_key "employees", "work_units"
  add_foreign_key "loans", "softwares"
  add_foreign_key "loans", "tools"
  add_foreign_key "loans", "users"
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "softwares", "vendors"
  add_foreign_key "stocks", "softwares"
  add_foreign_key "stocks", "tools"
  add_foreign_key "tools", "vendors"
end
