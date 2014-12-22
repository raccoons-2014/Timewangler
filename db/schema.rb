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

ActiveRecord::Schema.define(version: 20141222221532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "card_type",    null: false
    t.string   "name",         null: false
    t.text     "description",  null: false
    t.integer  "strength",     null: false
    t.integer  "intelligence", null: false
    t.integer  "charisma",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time_period"
  end

  create_table "deck_card_relationships", force: true do |t|
    t.integer  "card_id"
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deck_card_relationships", ["card_id"], name: "index_deck_card_relationships_on_card_id", using: :btree
  add_index "deck_card_relationships", ["deck_id"], name: "index_deck_card_relationships_on_deck_id", using: :btree

  create_table "decks", force: true do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "games", force: true do |t|
    t.integer  "player_one_id"
    t.integer  "player_two_id"
    t.integer  "winner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "round_number"
    t.integer  "player_one_health"
    t.string   "player_one_hand"
    t.string   "player_one_deck"
    t.integer  "player_two_health"
    t.string   "player_two_hand"
    t.string   "player_two_deck"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_periods", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "email"
  end

end
