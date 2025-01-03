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

ActiveRecord::Schema[8.0].define(version: 2024_12_30_194600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "feedback_items", force: :cascade do |t|
    t.string "feedback_type"
    t.string "token"
    t.string "provider_name"
    t.text "content"
    t.text "situation"
    t.text "behavior"
    t.text "impact"
    t.text "reflections"
    t.bigint "growth_plan_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["growth_plan_id"], name: "index_feedback_items_on_growth_plan_id"
    t.index ["token"], name: "index_feedback_items_on_token", unique: true
    t.index ["user_id"], name: "index_feedback_items_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "type"
    t.string "token"
    t.string "provider_name"
    t.text "content"
    t.text "situation"
    t.text "behavior"
    t.text "impact"
    t.text "reflections"
    t.bigint "growth_plan_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["growth_plan_id"], name: "index_feedbacks_on_growth_plan_id"
    t.index ["token"], name: "index_feedbacks_on_token", unique: true
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "growth_plans", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.text "impact"
    t.string "macro_skill"
    t.string "micro_skill"
    t.text "success_criteria"
    t.string "focus_area"
    t.string "category"
    t.string "scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "token"
    t.index ["token"], name: "index_growth_plans_on_token", unique: true
    t.index ["user_id"], name: "index_growth_plans_on_user_id"
  end

  create_table "progress_updates", force: :cascade do |t|
    t.string "token"
    t.text "actions"
    t.text "extractions"
    t.bigint "user_id", null: false
    t.bigint "growth_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["growth_plan_id"], name: "index_progress_updates_on_growth_plan_id"
    t.index ["token"], name: "index_progress_updates_on_token", unique: true
    t.index ["user_id"], name: "index_progress_updates_on_user_id"
  end

  create_table "role_profiles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.boolean "current"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.index ["token"], name: "index_role_profiles_on_token", unique: true
    t.index ["user_id"], name: "index_role_profiles_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "pronouns"
    t.date "date_of_birth"
    t.string "timezone"
    t.string "location"
    t.string "linkedin_url"
    t.string "portfolio_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "feedback_items", "growth_plans"
  add_foreign_key "feedback_items", "users"
  add_foreign_key "growth_plans", "users"
  add_foreign_key "progress_updates", "growth_plans"
  add_foreign_key "progress_updates", "users"
  add_foreign_key "role_profiles", "users"
  add_foreign_key "user_profiles", "users"
end
