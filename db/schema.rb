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

ActiveRecord::Schema.define(version: 20170826214728) do

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "start_time"
    t.time "time"
    t.string "comment"
    t.string "basic_services"
    t.string "chemical_services"
    t.string "color_services"
    t.string "weave"
    t.string "braids"
    t.string "treatment_services"
    t.integer "user_id"
    t.integer "stylist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stylist_id"], name: "index_appointments_on_stylist_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "image_portfolios", force: :cascade do |t|
    t.string "image"
    t.string "tittle"
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stylist_id"
    t.integer "user_id"
    t.index ["stylist_id"], name: "index_image_portfolios_on_stylist_id"
    t.index ["user_id"], name: "index_image_portfolios_on_user_id"
  end

  create_table "stylists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "bio"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "profile_pic"
    t.index ["user_id"], name: "index_stylists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "auth_token", default: ""
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end