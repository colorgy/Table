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

ActiveRecord::Schema.define(version: 20150515161909) do

  create_table "courses_simulator_items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "course_code"
    t.integer  "year"
    t.integer  "term"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "courses_simulator_items", ["user_id"], name: "index_courses_simulator_items_on_user_id"

  create_table "user_followed_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "followed_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_followed_users", ["followed_user_id"], name: "index_user_followed_users_on_followed_user_id"
  add_index "user_followed_users", ["user_id"], name: "index_user_followed_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sid"
    t.integer  "uuid"
    t.datetime "refreshed_at"
    t.string   "core_access_token"
    t.string   "core_refresh_token"
    t.string   "username"
    t.string   "name"
    t.string   "avatar_url"
    t.string   "cover_photo_url"
    t.string   "gender"
    t.string   "fbid"
    t.string   "uid"
    t.string   "identity"
    t.string   "organization_code"
    t.string   "department_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "followers_count",     default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["sid"], name: "index_users_on_sid", unique: true
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true

end
