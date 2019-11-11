# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_11_075449) do

  create_table "abouts", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_phone"
    t.string "customer_email"
    t.string "description"
    t.string "status"
    t.datetime "appointment_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.string "slug"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_comments", force: :cascade do |t|
    t.string "name"
    t.string "quote"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "darkhouse_news", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.string "image"
    t.string "sort_content"
    t.string "content"
    t.boolean "active"
    t.boolean "highlight"
    t.integer "create_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["create_by_id"], name: "index_darkhouse_news_on_create_by_id"
    t.index ["updated_by_id"], name: "index_darkhouse_news_on_updated_by_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.string "thump"
    t.string "image"
    t.string "sort_content"
    t.string "content"
    t.boolean "active"
    t.boolean "highlight"
    t.integer "category_id"
    t.integer "create_by_id"
    t.integer "updated_by_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_news_on_category_id"
    t.index ["create_by_id"], name: "index_news_on_create_by_id"
    t.index ["updated_by_id"], name: "index_news_on_updated_by_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "thump"
    t.string "image"
    t.integer "news_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sort"
    t.integer "image_type"
    t.integer "darkhouse_news_id"
    t.index ["news_id"], name: "index_photos_on_news_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.boolean "active"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
