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

ActiveRecord::Schema.define(version: 20151029071547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_zhao_id"
    t.string   "name",         null: false
    t.string   "mobile",       null: false
    t.string   "gender",       null: false
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "contacts", ["deleted_at"], name: "index_contacts_on_deleted_at", using: :btree
  add_index "contacts", ["gender"], name: "index_contacts_on_gender", using: :btree
  add_index "contacts", ["mobile"], name: "index_contacts_on_mobile", using: :btree
  add_index "contacts", ["name"], name: "index_contacts_on_name", using: :btree
  add_index "contacts", ["user_zhao_id"], name: "index_contacts_on_user_zhao_id", using: :btree

  create_table "user_admins", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "mobile",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "user_admins", ["confirmation_token"], name: "index_user_admins_on_confirmation_token", unique: true, using: :btree
  add_index "user_admins", ["email"], name: "index_user_admins_on_email", using: :btree
  add_index "user_admins", ["mobile", "email"], name: "index_user_admins_on_account", unique: true, using: :btree
  add_index "user_admins", ["mobile"], name: "index_user_admins_on_mobile", using: :btree
  add_index "user_admins", ["name"], name: "index_user_admins_on_name", unique: true, using: :btree
  add_index "user_admins", ["reset_password_token"], name: "index_user_admins_on_reset_password_token", unique: true, using: :btree
  add_index "user_admins", ["unlock_token"], name: "index_user_admins_on_unlock_token", unique: true, using: :btree

  create_table "user_songs", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "mobile",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "user_songs", ["confirmation_token"], name: "index_user_songs_on_confirmation_token", unique: true, using: :btree
  add_index "user_songs", ["email"], name: "index_user_songs_on_email", using: :btree
  add_index "user_songs", ["mobile", "email"], name: "index_user_songs_on_account", unique: true, using: :btree
  add_index "user_songs", ["mobile"], name: "index_user_songs_on_mobile", using: :btree
  add_index "user_songs", ["name"], name: "index_user_songs_on_name", unique: true, using: :btree
  add_index "user_songs", ["reset_password_token"], name: "index_user_songs_on_reset_password_token", unique: true, using: :btree
  add_index "user_songs", ["unlock_token"], name: "index_user_songs_on_unlock_token", unique: true, using: :btree

  create_table "user_zhaos", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "mobile",                 default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "user_zhaos", ["confirmation_token"], name: "index_user_zhaos_on_confirmation_token", unique: true, using: :btree
  add_index "user_zhaos", ["email"], name: "index_user_zhaos_on_email", using: :btree
  add_index "user_zhaos", ["mobile", "email"], name: "index_user_zhaos_on_account", unique: true, using: :btree
  add_index "user_zhaos", ["mobile"], name: "index_user_zhaos_on_mobile", using: :btree
  add_index "user_zhaos", ["name"], name: "index_user_zhaos_on_name", unique: true, using: :btree
  add_index "user_zhaos", ["reset_password_token"], name: "index_user_zhaos_on_reset_password_token", unique: true, using: :btree
  add_index "user_zhaos", ["unlock_token"], name: "index_user_zhaos_on_unlock_token", unique: true, using: :btree

  add_foreign_key "contacts", "user_zhaos"
end
