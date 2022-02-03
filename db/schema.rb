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

ActiveRecord::Schema.define(version: 2022_02_01_015658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aquaria", force: :cascade do |t|
    t.string "name"
    t.boolean "clean"
    t.integer "number_of_types"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boats", force: :cascade do |t|
    t.string "name"
    t.integer "crew_size"
    t.boolean "motor_powered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dock_id"
    t.index ["dock_id"], name: "index_boats_on_dock_id"
  end

  create_table "docks", force: :cascade do |t|
    t.string "name"
    t.boolean "open"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fish", force: :cascade do |t|
    t.string "name"
    t.boolean "bioluminescent"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "aquarium_id"
    t.index ["aquarium_id"], name: "index_fish_on_aquarium_id"
  end

  add_foreign_key "boats", "docks"
  add_foreign_key "fish", "aquaria"
end
