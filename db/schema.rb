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

ActiveRecord::Schema.define(version: 20150831184247) do

  create_table "episodes", force: :cascade do |t|
    t.string   "name"
    t.string   "image_link"
    t.string   "airdate"
    t.string   "imdb_link"
    t.string   "imdb_point"
    t.integer  "season_no"
    t.integer  "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "name"
    t.string   "imdb_link"
    t.string   "image_link"
    t.string   "date"
    t.string   "imdb_point"
    t.integer  "last_episode_id"
    t.boolean  "ongoing"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end