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

ActiveRecord::Schema.define(version: 20180515135241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "essays", force: :cascade do |t|
    t.string "title"
    t.date "due_date"
    t.text "prompt"
    t.text "thesis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "research_cards", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "essay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["essay_id"], name: "index_research_cards_on_essay_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.text "outline"
    t.text "rough_drafting"
    t.text "final_draft"
    t.bigint "essay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["essay_id"], name: "index_sections_on_essay_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.string "citation"
    t.text "notes"
    t.string "url"
    t.bigint "essay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["essay_id"], name: "index_sources_on_essay_id"
  end

  add_foreign_key "research_cards", "essays"
  add_foreign_key "sections", "essays"
  add_foreign_key "sources", "essays"
end
