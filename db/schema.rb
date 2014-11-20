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

ActiveRecord::Schema.define(version: 20141120123400) do

  create_table "events", force: true do |t|
    t.datetime "time"
    t.string   "location"
    t.boolean  "active",     default: true
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "rsvp",       default: false
    t.integer  "event_id"
  end

  create_table "guests", force: true do |t|
    t.string   "name"
    t.boolean  "rsvp"
    t.boolean  "invited_to_ceremony"
    t.boolean  "invited_to_evening"
    t.boolean  "vegetarian"
    t.integer  "group_size"
    t.boolean  "arrival_transportation_required"
    t.boolean  "departing_transport_requred"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "event_id"
  end

end
