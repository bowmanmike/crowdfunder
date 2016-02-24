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

ActiveRecord::Schema.define(version: 20160223230033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "pledges", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "backer_id"
    t.integer  "project_id"
    t.integer  "reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pledges", ["backer_id"], name: "index_pledges_on_backer_id", using: :btree
  add_index "pledges", ["project_id"], name: "index_pledges_on_project_id", using: :btree
  add_index "pledges", ["reward_id"], name: "index_pledges_on_reward_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "end_date"
    t.integer  "funding_goal"
    t.text     "description"
    t.integer  "owner_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "projects", ["owner_id"], name: "index_projects_on_owner_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "description"
    t.integer  "number_available"
    t.integer  "project_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "rewards", ["project_id"], name: "index_rewards_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "salt"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

  add_foreign_key "pledges", "projects"
  add_foreign_key "pledges", "rewards"
  add_foreign_key "pledges", "users", column: "backer_id"
  add_foreign_key "projects", "users", column: "owner_id"
  add_foreign_key "rewards", "projects"
end
