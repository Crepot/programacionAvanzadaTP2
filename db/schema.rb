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

ActiveRecord::Schema[7.0].define(version: 2022_06_19_194225) do
  create_table "games", force: :cascade do |t|
    t.integer "status_game"
    t.integer "winner"
    t.integer "curret_player"
    t.integer "current_hand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_hand_cards", force: :cascade do |t|
    t.integer "player_hand_id"
    t.integer "number"
    t.integer "palo"
    t.integer "effectiveness"
    t.boolean "show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_hand_id"], name: "index_player_hand_cards_on_player_hand_id"
  end

  create_table "player_hands", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "round_hand"
    t.integer "truco"
    t.integer "envido"
    t.integer "score_hand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_player_hands_on_game_id"
    t.index ["player_id"], name: "index_player_hands_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "tokenAuth"
    t.boolean "sessionActive"
    t.integer "team"
    t.string "email"
    t.integer "score"
    t.string "password_digest"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
