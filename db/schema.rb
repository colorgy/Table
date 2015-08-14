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

ActiveRecord::Schema.define(version: 20150814121756) do

  create_table "ask_courses", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "course_name"
    t.string   "course_lecturer"
    t.string   "course_organization_code"
    t.string   "course_general_code"
    t.string   "course_code"
    t.integer  "user_id"
    t.boolean  "anonymous",                default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "course_comments", force: :cascade do |t|
    t.string   "course_general_code"
    t.string   "course_year"
    t.string   "course_term"
    t.string   "user_avatar_url"
    t.string   "user_name"
    t.text     "body"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "organization_code"
    t.string   "course_lecturer"
    t.string   "course_name"
    t.boolean  "anonymous",           default: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "organization_code"
    t.string   "general_code"
    t.text     "scoring_method"
    t.text     "roll_call_frequency"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "students_count",      default: 0, null: false
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "course_code"
    t.string   "course_organization_code"
    t.integer  "year"
    t.integer  "term"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "uuid"
    t.string   "course_general_code"
  end

  add_index "user_courses", ["term"], name: "index_user_courses_on_term"
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id"
  add_index "user_courses", ["uuid"], name: "index_user_courses_on_uuid", unique: true
  add_index "user_courses", ["year"], name: "index_user_courses_on_year"

  create_table "user_followed_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "followed_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_followed_users", ["followed_user_id"], name: "index_user_followed_users_on_followed_user_id"
  add_index "user_followed_users", ["user_id"], name: "index_user_followed_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                               default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
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
    t.integer  "followers_count",                     default: 0
    t.string   "simulator_image_url"
    t.boolean  "first_login",                         default: true
    t.boolean  "shared",                              default: false
    t.boolean  "subscribed",                          default: false
    t.integer  "started_year"
    t.boolean  "courses_table_visibility",            default: true
    t.boolean  "fb_visibility",                       default: true
    t.boolean  "courses_table_visibility_for_guests", default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true

end
