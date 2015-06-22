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

ActiveRecord::Schema.define(version: 20150622224008) do

  create_table "games", force: :cascade do |t|
    t.integer  "home_team_id",     limit: 4
    t.integer  "away_team_id",     limit: 4
    t.string   "location",         limit: 255
    t.datetime "game_time"
    t.integer  "home_score",       limit: 4
    t.integer  "home_shots",       limit: 4
    t.integer  "home_pim",         limit: 4
    t.integer  "home_pp_goals",    limit: 4
    t.integer  "home_pp_attempts", limit: 4
    t.integer  "home_sh_goals",    limit: 4
    t.integer  "away_score",       limit: 4
    t.integer  "away_shots",       limit: 4
    t.integer  "away_pim",         limit: 4
    t.integer  "away_pp_goals",    limit: 4
    t.integer  "away_pp_attempts", limit: 4
    t.integer  "away_sh_goals",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "penalties", force: :cascade do |t|
    t.string   "infraction", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "penalty_stats", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.integer  "player_id",  limit: 4
    t.integer  "penalty_id", limit: 4
    t.integer  "period",     limit: 4
    t.time     "time"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "team_id",         limit: 4
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255,                 null: false
    t.string   "cell",            limit: 255
    t.integer  "salary",          limit: 4
    t.boolean  "admin",           limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest", limit: 255
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "scoring_stats", force: :cascade do |t|
    t.integer  "game_id",    limit: 4
    t.integer  "scorer_id",  limit: 4
    t.integer  "passer_id",  limit: 4
    t.integer  "period",     limit: 4
    t.time     "time"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.string   "manager",    limit: 255
    t.integer  "payroll",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
