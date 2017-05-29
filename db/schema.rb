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

ActiveRecord::Schema.define(version: 20170521200101) do

  create_table "auctions", force: :cascade do |t|
    t.string "active_users"
    t.datetime "start_time"
    t.integer "duration"
    t.integer "bid_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tv_show_instances", force: :cascade do |t|
    t.string "name"
    t.datetime "airtime"
    t.decimal "purchased_cpm"
    t.integer "tv_show_id"
    t.integer "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "name"
    t.decimal "cpm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "airtime", default: "{:start => [0,0], :end => [1,0]}"
    t.decimal "winning_bid1"
    t.decimal "winning_bid2"
    t.integer "winner1"
    t.integer "winner2"
    t.integer "bids_counter"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
