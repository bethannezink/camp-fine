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

ActiveRecord::Schema.define(version: 20150402222855) do

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "party"
    t.string   "chamber"
    t.integer  "first_elected"
    t.float    "total"
    t.float    "spent"
    t.float    "cash_on_hand"
    t.float    "debt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "cid"
    t.string   "district"
    t.string   "twitter_id"
    t.string   "facebook_id"
    t.string   "website"
    t.string   "phone_number"
  end

  create_table "contributions", force: :cascade do |t|
    t.integer  "donor_id"
    t.integer  "candidate_id"
    t.integer  "cycle"
    t.float    "individual_amount"
    t.float    "pac_amount"
    t.float    "total"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "donors", force: :cascade do |t|
    t.string   "name"
    t.string   "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.string   "industry_code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "industry_contributions", force: :cascade do |t|
    t.integer  "industry_id"
    t.integer  "candidate_id"
    t.integer  "cycle"
    t.float    "individual_amount"
    t.float    "pac_amount"
    t.float    "total"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "trigrams", force: :cascade do |t|
    t.string  "trigram",     limit: 3
    t.integer "score",       limit: 2
    t.integer "owner_id"
    t.string  "owner_type"
    t.string  "fuzzy_field"
  end

  add_index "trigrams", ["owner_id", "owner_type", "fuzzy_field", "trigram", "score"], name: "index_for_match"
  add_index "trigrams", ["owner_id", "owner_type"], name: "index_by_owner"

end
