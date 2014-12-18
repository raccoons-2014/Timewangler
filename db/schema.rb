# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141218222447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deck_cards", force: true do |t|
    t.integer  "hero_card_id"
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deck_cards", ["deck_id"], name: "index_deck_cards_on_deck_id", using: :btree
  add_index "deck_cards", ["hero_card_id"], name: "index_deck_cards_on_hero_card_id", using: :btree

  create_table "decks", force: true do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "hero_cards", force: true do |t|
    t.string   "name",           null: false
    t.integer  "time_period_id", null: false
    t.text     "description",    null: false
    t.integer  "strength",       null: false
    t.integer  "intelligence",   null: false
    t.integer  "charisma",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hero_cards", ["time_period_id"], name: "index_hero_cards_on_time_period_id", using: :btree

  create_table "time_periods", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
