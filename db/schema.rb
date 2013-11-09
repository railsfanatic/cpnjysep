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

ActiveRecord::Schema.define(version: 20131109231922) do

  create_table "activities", force: true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.integer  "length_in_minutes"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "content"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grams", force: true do |t|
    t.string   "media_id"
    t.string   "media_type"
    t.string   "link"
    t.text     "caption",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "low_res"
    t.string   "standard_res"
  end

  add_index "grams", ["created_at"], name: "index_grams_on_created_at"
  add_index "grams", ["media_id"], name: "index_grams_on_media_id"

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.string   "tweet_id"
    t.string   "screen_name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["created_at"], name: "index_tweets_on_created_at"
  add_index "tweets", ["tweet_id"], name: "index_tweets_on_tweet_id"

end
