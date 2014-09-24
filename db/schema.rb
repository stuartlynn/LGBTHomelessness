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

ActiveRecord::Schema.define(version: 20140924162433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.integer  "organization_id"
    t.integer  "program_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "place_id"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_no"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "programs", force: true do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.string   "friendliness_rating"
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "health_status_req"
    t.string   "gender_req"
    t.text     "access_to_services"
    t.text     "description"
    t.text     "program_timing"
    t.string   "language_req"
    t.string   "program_categorization"
    t.text     "services"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sexual_orientation_requirement"
  end

  create_table "volunteers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "announcment"
    t.string   "location"
    t.string   "program_requirements"
    t.string   "age"
    t.string   "skills"
    t.string   "time"
    t.text     "available"
    t.text     "anything_else"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
