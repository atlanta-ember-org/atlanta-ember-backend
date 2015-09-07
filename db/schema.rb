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

ActiveRecord::Schema.define(version: 20150905031147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "meetup_id"
    t.string   "serialized_venue"
    t.string   "name"
    t.string   "event_url"
    t.integer  "yes_rsvp_count"
    t.text     "description"
    t.string   "status"
    t.datetime "originally_created_at"
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meetup_id"
  end

  create_table "venues", force: true do |t|
    t.string   "country"
    t.string   "city"
    t.string   "address_1"
    t.integer  "yes_rsvp_count"
    t.string   "name"
    t.integer  "lon"
    t.integer  "lat"
    t.boolean  "repinned"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
