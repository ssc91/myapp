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

ActiveRecord::Schema.define(:version => 20140717104648) do

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "address"
    t.string   "phone"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.boolean  "is_admin",        :default => false
    t.string   "remember_token"
  end

  add_index "customers", ["remember_token"], :name => "index_customers_on_remember_token"

  create_table "items", :force => true do |t|
    t.string   "item_name"
    t.integer  "restaurant_id"
    t.integer  "item_price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.string   "order_list"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "user_rating"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "ratings", ["restaurant_id"], :name => "index_ratings_on_restaurant_id"
  add_index "ratings", ["user_id", "restaurant_id"], :name => "index_ratings_on_user_id_and_restaurant_id", :unique => true
  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "restaurants", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "remember_token"
    t.string   "cuisine"
    t.string   "timings"
  end

  add_index "restaurants", ["remember_token"], :name => "index_restaurants_on_remember_token"

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.text     "user_feedback"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"

end
