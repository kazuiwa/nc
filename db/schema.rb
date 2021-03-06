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

ActiveRecord::Schema.define(version: 20170730074845) do

  create_table "clients", force: :cascade do |t|
    t.string   "sei"
    t.string   "mei"
    t.string   "kana_sei"
    t.string   "kana_mei"
    t.integer  "sex"
    t.string   "birthday_year"
    t.string   "birthday_month_day"
    t.string   "postal_code"
    t.string   "address"
    t.string   "tel1"
    t.string   "tel2"
    t.string   "tel3"
    t.string   "mail"
    t.string   "douki"
    t.string   "douki_etc"
    t.string   "shoukaisha"
    t.string   "memo_client"
    t.string   "memo_admin"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
