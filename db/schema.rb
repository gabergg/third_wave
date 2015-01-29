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

ActiveRecord::Schema.define(version: 20150129043653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beans", force: true do |t|
    t.string   "name"
    t.string   "roast"
    t.string   "origin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "avg_rating",  default: 0.0
    t.integer  "num_ratings", default: 0
    t.integer  "roaster_id"
  end

  add_index "beans", ["origin"], name: "index_beans_on_origin", using: :btree
  add_index "beans", ["roast"], name: "index_beans_on_roast", using: :btree

  create_table "reviews", force: true do |t|
    t.float    "rating"
    t.string   "brew_method"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "bean_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["rating", "user_id", "bean_id", "created_at"], name: "index_reviews_on_rating_and_user_id_and_bean_id_and_created_at", using: :btree

  create_table "roasters", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.float    "avg_rating",  default: 0.0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_ratings", default: 0
  end

  add_index "roasters", ["avg_rating"], name: "index_roasters_on_avg_rating", using: :btree
  add_index "roasters", ["location"], name: "index_roasters_on_location", using: :btree
  add_index "roasters", ["name"], name: "index_roasters_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
