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

ActiveRecord::Schema.define(version: 20150501104039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crews", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "genre_id"
    t.integer "movie_id"
  end

  add_index "genres_movies", ["genre_id"], name: "index_genres_movies_on_genre_id", using: :btree
  add_index "genres_movies", ["movie_id"], name: "index_genres_movies_on_movie_id", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.text     "synopsis"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "country"
    t.integer  "year"
    t.float    "review"
    t.string   "rating"
    t.integer  "runtime"
    t.string   "language"
    t.date     "release_date"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "crew_id"
    t.string   "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["crew_id"], name: "index_roles_on_crew_id", using: :btree
  add_index "roles", ["movie_id"], name: "index_roles_on_movie_id", using: :btree

  add_foreign_key "roles", "crews"
  add_foreign_key "roles", "movies"
end
