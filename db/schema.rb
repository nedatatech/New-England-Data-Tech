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

ActiveRecord::Schema.define(version: 20180507135132) do

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "albums_images", id: false, force: :cascade do |t|
    t.integer "album_id", null: false
    t.integer "image_id", null: false
    t.index ["album_id", "image_id"], name: "index_albums_images_on_album_id_and_image_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "file"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "file"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.float    "rating"
    t.string   "first_name"
    t.string   "last_initial"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "service_contents", force: :cascade do |t|
    t.integer  "service_id"
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_service_contents_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "job_type"
    t.string   "description"
    t.text     "page_body"
    t.decimal  "base_price"
    t.decimal  "hourly_rate"
    t.decimal  "avg_cost"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["slug"], name: "index_services_on_slug"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
