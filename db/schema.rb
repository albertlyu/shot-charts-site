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

ActiveRecord::Schema.define(version: 20140515030315) do

  create_table "games", primary_key: "game_id", force: true do |t|
    t.date     "date"
    t.integer  "year"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.string   "venue_name"
    t.string   "venue_city"
    t.string   "venue_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_games", force: true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "team_id"
    t.string   "player_first_name"
    t.string   "player_last_name"
    t.integer  "player_position"
    t.integer  "player_uniform_number"
    t.integer  "field_goals_made"
    t.integer  "field_goals_att"
    t.float    "field_goals_pct"
    t.integer  "free_throws_made"
    t.integer  "free_throws_att"
    t.float    "free_throws_pct"
    t.integer  "three_point_field_goals_made"
    t.integer  "three_point_field_goals_att"
    t.float    "three_point_field_goals_pct"
    t.integer  "points"
    t.integer  "rebounds_total"
    t.integer  "rebounds_off"
    t.integer  "rebounds_def"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocked_shots"
    t.integer  "turnovers"
    t.integer  "personal_fouls"
    t.integer  "disqualifications"
    t.integer  "technical_fouls"
    t.integer  "minutes"
    t.boolean  "starter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", primary_key: "player_id", force: true do |t|
    t.integer  "team_id"
    t.string   "player_first_name"
    t.string   "player_last_name"
    t.integer  "player_position"
    t.integer  "player_uniform_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plays", force: true do |t|
    t.integer  "game_id"
    t.integer  "half"
    t.integer  "time_minutes"
    t.integer  "time_seconds"
    t.string   "details"
    t.integer  "player_id_1"
    t.integer  "player_id_2"
    t.string   "player_first_name_1"
    t.string   "player_first_name_2"
    t.string   "player_last_name_1"
    t.string   "player_last_name_2"
    t.integer  "home_score"
    t.integer  "visitor_score"
    t.integer  "visitor_fouls"
    t.integer  "home_fouls"
    t.integer  "player_score"
    t.integer  "points_type"
    t.string   "detail_desc"
    t.string   "event_desc"
    t.integer  "distance"
    t.float    "x_coord"
    t.float    "y_coord"
    t.integer  "team_id_1"
    t.integer  "team_id_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_games", force: true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "field_goals_made"
    t.integer  "field_goals_att"
    t.float    "field_goals_pct"
    t.integer  "free_throws_made"
    t.integer  "free_throws_att"
    t.float    "free_throws_pct"
    t.integer  "three_point_field_goals_made"
    t.integer  "three_point_field_goals_att"
    t.float    "three_point_field_goals_pct"
    t.integer  "points"
    t.integer  "rebounds_total"
    t.integer  "rebounds_off"
    t.integer  "rebounds_def"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocked_shots"
    t.integer  "turnovers"
    t.integer  "personal_fouls"
    t.integer  "technical_fouls"
    t.integer  "minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", primary_key: "team_id", force: true do |t|
    t.string   "team_alias"
    t.string   "team_name"
    t.string   "team_mascot"
    t.string   "team_div"
    t.string   "team_conf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
