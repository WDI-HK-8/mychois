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

ActiveRecord::Schema.define(version: 20150823092629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groceries", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grocery_list_items", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "current_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "grocery_id"
  end

  add_index "grocery_list_items", ["grocery_id"], name: "index_grocery_list_items_on_grocery_id", using: :btree

  create_table "grocery_lists", force: :cascade do |t|
    t.decimal  "total_price"
    t.text     "additional_comments"
    t.boolean  "substitutions"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "customer_id"
    t.integer  "shopper_id"
    t.integer  "grocery_list_item_id"
  end

  add_index "grocery_lists", ["customer_id"], name: "index_grocery_lists_on_customer_id", using: :btree
  add_index "grocery_lists", ["grocery_list_item_id"], name: "index_grocery_lists_on_grocery_list_item_id", using: :btree
  add_index "grocery_lists", ["shopper_id"], name: "index_grocery_lists_on_shopper_id", using: :btree

  create_table "user_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.integer  "phone_number"
    t.integer  "offence",                default: 0
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "district_id"
    t.integer  "user_type_id"
  end

  add_index "users", ["district_id"], name: "index_users_on_district_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id", using: :btree

  add_foreign_key "grocery_list_items", "groceries"
  add_foreign_key "grocery_lists", "grocery_list_items"
  add_foreign_key "grocery_lists", "users", column: "customer_id"
  add_foreign_key "grocery_lists", "users", column: "shopper_id"
  add_foreign_key "users", "districts"
  add_foreign_key "users", "user_types"
end
