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

ActiveRecord::Schema.define(version: 2018_11_15_065054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "body_text"
    t.string "image_url"
    t.string "source_url"
    t.string "language"
    t.string "location"
    t.decimal "lat"
    t.decimal "lng"
    t.string "publishing_type"
    t.datetime "date_time_published"
    t.integer "count_views"
    t.integer "average_user_score"
    t.boolean "published"
    t.bigint "publisher_id"
    t.bigint "author_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_articles_on_author_id"
    t.index ["event_id"], name: "index_articles_on_event_id"
    t.index ["publisher_id"], name: "index_articles_on_publisher_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "twitter_handle"
    t.string "location"
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "date_time"
    t.string "location"
    t.decimal "lat"
    t.decimal "lng"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_events_on_topic_id"
  end

  create_table "following_items", force: :cascade do |t|
    t.string "follower_type"
    t.bigint "follower_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_type", "follower_id"], name: "index_following_items_on_follower_type_and_follower_id"
    t.index ["user_id"], name: "index_following_items_on_user_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.string "web_url"
    t.string "location"
    t.decimal "lat"
    t.decimal "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saved_articles", force: :cascade do |t|
    t.bigint "article_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_saved_articles_on_article_id"
    t.index ["user_id"], name: "index_saved_articles_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_scores", force: :cascade do |t|
    t.integer "score"
    t.bigint "article_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_user_scores_on_article_id"
    t.index ["user_id"], name: "index_user_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "authors"
  add_foreign_key "articles", "events"
  add_foreign_key "articles", "publishers"
  add_foreign_key "events", "topics"
  add_foreign_key "following_items", "users"
  add_foreign_key "saved_articles", "articles"
  add_foreign_key "saved_articles", "users"
  add_foreign_key "user_scores", "articles"
  add_foreign_key "user_scores", "users"
end
