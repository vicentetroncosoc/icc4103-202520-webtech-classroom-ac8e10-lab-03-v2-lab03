# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_09_08_072352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "reservation_id"
    t.integer "nights_subtotal"
    t.integer "services_subtotal"
    t.integer "tax"
    t.integer "total"
    t.datetime "issued_at"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "code", null: false
    t.integer "guest_id", null: false
    t.integer "room_id", null: false
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.integer "status", null: false
    t.integer "adults", null: false
    t.integer "children", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "number", null: false
    t.integer "room_type", null: false
    t.integer "price", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_usages", force: :cascade do |t|
    t.integer "reservation_id"
    t.integer "service_id"
    t.integer "quantity"
    t.datetime "used_at"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.boolean "is_active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services_usages", force: :cascade do |t|
    t.integer "reservation_id", null: false
    t.integer "service_id", null: false
    t.integer "quantity", null: false
    t.datetime "used_at", null: false
    t.text "note", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
