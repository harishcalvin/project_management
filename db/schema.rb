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

ActiveRecord::Schema[7.2].define(version: 2024_09_02_115951) do
  create_table "milestones", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "internal"
    t.boolean "client_facing"
    t.boolean "completed"
    t.integer "phase_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id"], name: "index_milestones_on_phase_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.date "start_date"
    t.date "end_end"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "client_description"
    t.index ["project_id"], name: "index_phases_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "application_number"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "project_start_date"
    t.date "project_est_end_date"
  end

  add_foreign_key "milestones", "phases"
  add_foreign_key "phases", "projects"
end
