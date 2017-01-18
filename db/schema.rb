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

ActiveRecord::Schema.define(version: 20170118222213) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id1"
    t.integer  "user_id2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "theme_id"
    t.string   "title"
    t.string   "description"
    t.integer  "cost"
    t.string   "location"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "demands", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "theme_id"
    t.string   "title"
    t.string   "description"
    t.integer  "cost"
    t.string   "location"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dispo_users", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "dispo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_backs", force: :cascade do |t|
    t.integer  "lessons_id"
    t.integer  "feed_backer_id"
    t.integer  "note"
    t.string   "comment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "keyword_courses", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keyword_dems", force: :cascade do |t|
    t.integer  "dem_id"
    t.integer  "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "course_origin"
    t.integer  "teacher_id"
    t.integer  "pupil_id"
    t.integer  "origin_id"
    t.date     "date"
    t.string   "location"
    t.integer  "cost"
    t.integer  "evolution"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conv_id"
    t.integer  "user_id"
    t.string   "msg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "msg"
    t.string   "status"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_verifs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "email"
    t.integer  "phone_number"
    t.integer  "nb_skilly"
    t.date     "birth_date"
    t.string   "location"
    t.string   "photo"
    t.integer  "verif"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
  end

end
