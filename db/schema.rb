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

ActiveRecord::Schema.define(version: 20130201012015) do

  create_table "charities", force: true do |t|
    t.string   "name"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "individual_pages", force: true do |t|
    t.integer  "registration_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "individual_pages", ["registration_id"], name: "index_individual_pages_on_registration_id"

  create_table "line_items", force: true do |t|
    t.integer  "sourceable_id"
    t.string   "sourceable_type"
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "orders", force: true do |t|
    t.integer  "line_items_count",   default: 0
    t.integer  "user_id"
    t.string   "token"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transactions_count", default: 0
  end

  add_index "orders", ["token"], name: "index_orders_on_token"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "registrations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "surname"
    t.string   "nickname"
    t.string   "gender"
    t.string   "distance"
    t.string   "fundraiser"
    t.integer  "charity_id"
    t.date     "birthday"
  end

  create_table "transactions", force: true do |t|
    t.integer  "amount_cents"
    t.string   "currency"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["order_id"], name: "index_transactions_on_order_id"

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "nickname"
    t.string   "email"
    t.date     "birthday"
    t.string   "token"
    t.string   "uid"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

end
