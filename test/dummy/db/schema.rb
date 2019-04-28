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

ActiveRecord::Schema.define(version: 2019_04_28_155617) do

  create_table "yati_locales", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_yati_locales_on_name", unique: true
  end

  create_table "yati_phrases", force: :cascade do |t|
    t.text "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_yati_phrases_on_key", unique: true
  end

  create_table "yati_translations", force: :cascade do |t|
    t.integer "phrase_id"
    t.integer "locale_id"
    t.text "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "primary_updated", default: false
    t.text "previous_text"
    t.index ["phrase_id", "locale_id"], name: "index_yati_translations_on_phrase_id_and_locale_id", unique: true
  end

end
