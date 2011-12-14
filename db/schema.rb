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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111212034305) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["category_id"], :name => "index_categories_on_category_id"

  create_table "fund_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funds", :force => true do |t|
    t.integer  "account_id"
    t.integer  "fundType_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funds", ["account_id"], :name => "index_funds_on_account_id"
  add_index "funds", ["fundType_id"], :name => "index_funds_on_fundType_id"

  create_table "records", :force => true do |t|
    t.float    "fee"
    t.integer  "category_id"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  add_index "records", ["category_id"], :name => "index_records_on_category_id"

end
