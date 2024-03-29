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

ActiveRecord::Schema.define(version: 20210316034747) do

  create_table "applies", force: :cascade do |t|
    t.date "application_month"
    t.integer "status"
    t.integer "member_id"
    t.integer "superior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_applies_on_member_id"
    t.index ["superior_id"], name: "index_applies_on_superior_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "base_points", force: :cascade do |t|
    t.integer "base_point_number"
    t.string "base_point_name"
    t.string "attendance_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "affiliation"
    t.integer "employee_number"
    t.string "uid"
    t.datetime "basic_work_time", default: "2021-03-15 23:00:00"
    t.datetime "designated_work_start_time", default: "2021-03-16 00:00:00"
    t.datetime "datetime", default: "2021-03-16 09:00:00"
    t.datetime "designated_work_end_time", default: "2021-03-16 09:00:00"
    t.boolean "superior"
    t.boolean "admin"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
