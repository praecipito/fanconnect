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

ActiveRecord::Schema[7.0].define(version: 2024_02_16_215659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.integer "favorite_shirt_number"
    t.integer "shoe_size"
    t.integer "number_of_children"
    t.integer "height"
    t.integer "weight"
    t.string "position"
    t.string "birth_city"
    t.integer "minimum_income"
    t.integer "maximum_income"
    t.string "favorite_food"
    t.string "favorite_drink"
    t.string "preferred_look"
    t.string "favorite_videogame"
    t.integer "membership_duration"
    t.string "sport_interest"
    t.boolean "merchandising_interest"
    t.string "preferred_communication_channel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "favorite_shirt_number"
    t.integer "shoe_size"
    t.integer "number_of_children"
    t.integer "height"
    t.integer "weight"
    t.string "birth_city"
    t.integer "minimum_income"
    t.integer "maximum_income"
    t.string "favorite_food"
    t.string "favorite_drink"
    t.string "preferred_look"
    t.string "favorite_videogame"
    t.integer "membership_duration"
    t.string "sport_interest"
    t.boolean "merchandising_interest"
    t.string "preferred_communication_channel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "profiles", "users"
end
