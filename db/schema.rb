# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_12_09_230458) do
  create_table "scores", force: :cascade do |t|
    t.integer "strike"
    t.integer "spare"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "lane"
    t.string "oil_condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_scores", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "score_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["score_id"], name: "index_user_scores_on_score_id"
    t.index ["user_id"], name: "index_user_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "user_scores", "scores"
  add_foreign_key "user_scores", "users"
end
