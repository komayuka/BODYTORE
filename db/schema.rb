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

ActiveRecord::Schema.define(version: 2021_05_10_074503) do

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "customer_name", null: false
    t.string "customer_image_id"
    t.integer "body_weight"
    t.integer "height"
    t.integer "age", null: false
    t.text "customer_introduction"
    t.integer "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "trainers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "trainer_name", null: false
    t.text "trainer_introduction"
    t.integer "rate"
    t.string "trainer_image_id"
    t.integer "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_trainers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_trainers_on_reset_password_token", unique: true
  end

  create_table "training_menus", force: :cascade do |t|
    t.integer "training_id", null: false
    t.integer "trainer_id", null: false
    t.integer "customer_id", null: false
    t.string "training_name", null: false
    t.integer "category", null: false
    t.text "description"
    t.integer "training_menu_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.integer "training_menu_id", null: false
    t.integer "trainer_id", null: false
    t.text "training_description"
    t.string "training_name", null: false
    t.boolean "training_status", default: false, null: false
    t.string "training_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
