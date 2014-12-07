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

ActiveRecord::Schema.define(version: 20141205053221) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["producer_id"], name: "brands_producer_id_fk", using: :btree

  create_table "producers", force: true do |t|
    t.string   "name"
    t.integer  "nom"
    t.integer  "dot"
    t.string   "address"
    t.string   "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "style"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand_id"], name: "products_brand_id_fk", using: :btree

  add_foreign_key "brands", "producers", name: "brands_producer_id_fk"

  add_foreign_key "products", "brands", name: "products_brand_id_fk"

end
