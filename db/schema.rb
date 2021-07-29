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

ActiveRecord::Schema.define(version: 2021_07_29_035307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "magazines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "magazines_positions", force: :cascade do |t|
    t.bigint "magazine_id"
    t.bigint "oenologist_id"
    t.boolean "editor", default: false
    t.boolean "writer", default: false
    t.boolean "reviewer", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["magazine_id"], name: "index_magazines_positions_on_magazine_id"
    t.index ["oenologist_id"], name: "index_magazines_positions_on_oenologist_id"
  end

  create_table "oenologists", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "nationality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strains", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wines_scores", force: :cascade do |t|
    t.bigint "wine_id"
    t.bigint "oenologist_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oenologist_id"], name: "index_wines_scores_on_oenologist_id"
    t.index ["wine_id"], name: "index_wines_scores_on_wine_id"
  end

  create_table "wines_strains", force: :cascade do |t|
    t.bigint "wine_id"
    t.bigint "strain_id"
    t.float "proportion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["strain_id"], name: "index_wines_strains_on_strain_id"
    t.index ["wine_id"], name: "index_wines_strains_on_wine_id"
  end

  add_foreign_key "magazines_positions", "magazines"
  add_foreign_key "magazines_positions", "oenologists"
  add_foreign_key "wines_scores", "oenologists"
  add_foreign_key "wines_scores", "wines"
  add_foreign_key "wines_strains", "strains"
  add_foreign_key "wines_strains", "wines"
end
