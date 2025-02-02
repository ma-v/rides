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

ActiveRecord::Schema.define(version: 2019_10_23_075635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "locked_at"
  end

  create_table "maps", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "format"
    t.integer "price_cents", default: 0, null: false
    t.integer "distance"
    t.integer "elevation"
    t.integer "time"
    t.integer "speed"
    t.string "map_url"
  end

  create_table "orders", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.string "last_name"
    t.string "first_name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "map_id"
    t.jsonb "payment"
    t.string "map_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "state"
    t.string "email"
    t.boolean "shipped", default: false
    t.string "tracking_number"
    t.bigint "user_id"
    t.string "post_code"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.index ["map_id"], name: "index_orders_on_map_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "strava_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "maps"
  add_foreign_key "orders", "users"
end
