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

ActiveRecord::Schema.define(:version => 20190617142213) do

  create_table "arrivals", :force => true do |t|
    t.integer  "product_id"
    t.float    "incoming_price"
    t.float    "count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.float    "sale_price"
    t.integer  "receiver_id"
  end

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "material_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "picture"
    t.float    "cost",        :default => 0.0, :null => false
  end

  add_index "articles", ["material_id"], :name => "index_articles_on_material_id"

  create_table "casts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.integer  "product_id"
    t.integer  "menu_id"
    t.float    "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "city"
    t.string   "street"
    t.integer  "building"
  end

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.integer  "cast_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "materials", ["cast_id"], :name => "index_materials_on_cast_id"

  create_table "menu_pages", :force => true do |t|
    t.string   "picture"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menus", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.float    "weight"
    t.string   "picture"
  end

  create_table "orders", :force => true do |t|
    t.integer  "seller_id"
    t.string   "client_name"
    t.datetime "datetime"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "table_number"
    t.integer  "status_id"
  end

  create_table "posters", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "context"
    t.datetime "approximate_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "incoming_price"
    t.float    "sale_price"
    t.float    "total_count"
    t.float    "amount_per_one"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "measure"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "sales", :force => true do |t|
    t.integer  "menu_id"
    t.float    "price"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "count",      :default => 1
    t.integer  "order_id"
  end

  create_table "slides", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "table_reservation_blackout_dates", :force => true do |t|
    t.date     "date"
    t.integer  "hall"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "table_reservation_blackout_dates", ["date", "hall"], :name => "index_table_reservation_blackout_dates_on_date_and_hall", :unique => true

  create_table "table_reservations", :force => true do |t|
    t.integer  "chat_id"
    t.date     "date",                             :null => false
    t.integer  "hall"
    t.string   "table"
    t.time     "time_from"
    t.time     "time_lasts_up"
    t.time     "time_to"
    t.string   "user_name"
    t.string   "user_phone"
    t.integer  "people_number"
    t.string   "status",        :default => "new", :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "table_reservations", ["date"], :name => "index_table_reservations_on_date"
  add_index "table_reservations", ["status"], :name => "index_table_reservations_on_status"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar"
    t.string   "name"
    t.string   "middle_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
