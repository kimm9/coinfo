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

ActiveRecord::Schema.define(version: 20180423192419) do

  create_table "coins", force: :cascade do |t|
    t.string   "coin_name"
    t.string   "symbol"
    t.integer  "price_usd"
    t.integer  "percent_change_1h"
    t.integer  "percent_change_24h"
    t.integer  "percent_change_7d"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "coins_portfolios", id: false, force: :cascade do |t|
    t.integer "coin_id",      null: false
    t.integer "portfolio_id", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "url"
    t.datetime "published"
    t.string   "guide"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_talbe_coin_portfolios", force: :cascade do |t|
    t.string "coin"
    t.string "portfolio"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "title"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
