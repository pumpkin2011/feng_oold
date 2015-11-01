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

ActiveRecord::Schema.define(version: 20151101030945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_ins", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_type"
    t.decimal  "amount",       precision: 10, scale: 2, null: false
    t.string   "serial_inner",                          null: false
    t.string   "serial_outer"
    t.string   "channel",                               null: false
    t.string   "state",                                 null: false
    t.string   "note"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.datetime "deleted_at"
  end

  add_index "cash_ins", ["channel"], name: "index_cash_ins_on_channel", using: :btree
  add_index "cash_ins", ["deleted_at"], name: "index_cash_ins_on_deleted_at", using: :btree
  add_index "cash_ins", ["serial_inner"], name: "index_cash_ins_on_serial_inner", unique: true, using: :btree
  add_index "cash_ins", ["serial_outer"], name: "index_cash_ins_on_serial_outer", unique: true, using: :btree
  add_index "cash_ins", ["state"], name: "index_cash_ins_on_state", using: :btree
  add_index "cash_ins", ["user_type", "user_id"], name: "index_cash_ins_on_user_type_and_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.integer  "user_zhao_id"
    t.string   "name",         null: false
    t.string   "province",     null: false
    t.string   "city",         null: false
    t.string   "district",     null: false
    t.string   "address",      null: false
    t.text     "introduction", null: false
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "companies", ["city"], name: "index_companies_on_city", using: :btree
  add_index "companies", ["deleted_at"], name: "index_companies_on_deleted_at", using: :btree
  add_index "companies", ["district"], name: "index_companies_on_district", using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["province"], name: "index_companies_on_province", using: :btree
  add_index "companies", ["user_zhao_id"], name: "index_companies_on_user_zhao_id", using: :btree

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

  create_table "industries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "name_seo",   null: false
    t.integer  "parent_id"
    t.integer  "lft",        null: false
    t.integer  "rgt",        null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "industries", ["deleted_at"], name: "index_industries_on_deleted_at", using: :btree
  add_index "industries", ["lft"], name: "index_industries_on_lft", using: :btree
  add_index "industries", ["name"], name: "index_industries_on_name", using: :btree
  add_index "industries", ["name_seo"], name: "index_industries_on_name_seo", unique: true, using: :btree
  add_index "industries", ["parent_id"], name: "index_industries_on_parent_id", using: :btree
  add_index "industries", ["rgt"], name: "index_industries_on_rgt", using: :btree

  create_table "intentions_positions", id: false, force: :cascade do |t|
    t.integer "intention_id", null: false
    t.integer "position_id",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_zhao_id"
    t.integer  "company_id"
    t.integer  "contact_id"
    t.integer  "position_id"
    t.string   "name",         null: false
    t.string   "gender",       null: false
    t.integer  "age_min",      null: false
    t.integer  "age_max",      null: false
    t.integer  "salary_basic", null: false
    t.integer  "salary_min",   null: false
    t.integer  "salary_max",   null: false
    t.string   "state",        null: false
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "jobs", ["age_max"], name: "index_jobs_on_age_max", using: :btree
  add_index "jobs", ["age_min"], name: "index_jobs_on_age_min", using: :btree
  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["contact_id"], name: "index_jobs_on_contact_id", using: :btree
  add_index "jobs", ["deleted_at"], name: "index_jobs_on_deleted_at", using: :btree
  add_index "jobs", ["gender"], name: "index_jobs_on_gender", using: :btree
  add_index "jobs", ["name"], name: "index_jobs_on_name", using: :btree
  add_index "jobs", ["position_id"], name: "index_jobs_on_position_id", using: :btree
  add_index "jobs", ["salary_basic"], name: "index_jobs_on_salary_basic", using: :btree
  add_index "jobs", ["salary_max"], name: "index_jobs_on_salary_max", using: :btree
  add_index "jobs", ["salary_min"], name: "index_jobs_on_salary_min", using: :btree
  add_index "jobs", ["state"], name: "index_jobs_on_state", using: :btree
  add_index "jobs", ["user_zhao_id"], name: "index_jobs_on_user_zhao_id", using: :btree

  create_table "labor_intentions", force: :cascade do |t|
    t.integer  "labor_id"
    t.string   "salary"
    t.string   "province"
    t.string   "city"
    t.string   "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "labor_intentions", ["city"], name: "index_labor_intentions_on_city", using: :btree
  add_index "labor_intentions", ["district"], name: "index_labor_intentions_on_district", using: :btree
  add_index "labor_intentions", ["labor_id"], name: "index_labor_intentions_on_labor_id", using: :btree
  add_index "labor_intentions", ["province"], name: "index_labor_intentions_on_province", using: :btree
  add_index "labor_intentions", ["salary"], name: "index_labor_intentions_on_salary", using: :btree

  create_table "labors", force: :cascade do |t|
    t.integer  "user_song_id"
    t.string   "name",         null: false
    t.string   "mobile",       null: false
    t.string   "idcard",       null: false
    t.string   "gender",       null: false
    t.date     "birthday",     null: false
    t.string   "channel",      null: false
    t.string   "province",     null: false
    t.string   "city",         null: false
    t.string   "district",     null: false
    t.string   "state",        null: false
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "labors", ["birthday"], name: "index_labors_on_birthday", using: :btree
  add_index "labors", ["channel"], name: "index_labors_on_channel", using: :btree
  add_index "labors", ["city"], name: "index_labors_on_city", using: :btree
  add_index "labors", ["deleted_at"], name: "index_labors_on_deleted_at", using: :btree
  add_index "labors", ["district"], name: "index_labors_on_district", using: :btree
  add_index "labors", ["gender"], name: "index_labors_on_gender", using: :btree
  add_index "labors", ["idcard"], name: "index_labors_on_idcard", using: :btree
  add_index "labors", ["mobile"], name: "index_labors_on_mobile", using: :btree
  add_index "labors", ["name"], name: "index_labors_on_name", using: :btree
  add_index "labors", ["province"], name: "index_labors_on_province", using: :btree
  add_index "labors", ["state"], name: "index_labors_on_state", using: :btree
  add_index "labors", ["user_song_id"], name: "index_labors_on_user_song_id", using: :btree

  create_table "nodes", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "icon",         null: false
    t.string   "uri",          null: false
    t.string   "domain",       null: false
    t.datetime "published_at"
    t.datetime "deleted_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "name_seo",   null: false
    t.integer  "parent_id"
    t.integer  "lft",        null: false
    t.integer  "rgt",        null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["deleted_at"], name: "index_positions_on_deleted_at", using: :btree
  add_index "positions", ["lft"], name: "index_positions_on_lft", using: :btree
  add_index "positions", ["name"], name: "index_positions_on_name", using: :btree
  add_index "positions", ["name_seo"], name: "index_positions_on_name_seo", unique: true, using: :btree
  add_index "positions", ["parent_id"], name: "index_positions_on_parent_id", using: :btree
  add_index "positions", ["rgt"], name: "index_positions_on_rgt", using: :btree

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
    t.string   "name",                                                          null: false
    t.string   "mobile",                                          default: "",  null: false
    t.string   "email",                                           default: "",  null: false
    t.string   "encrypted_password",                              default: "",  null: false
    t.decimal  "balance",                precision: 10, scale: 2, default: 0.0, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                                 default: 0,   null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "user_songs", ["confirmation_token"], name: "index_user_songs_on_confirmation_token", unique: true, using: :btree
  add_index "user_songs", ["email"], name: "index_user_songs_on_email", using: :btree
  add_index "user_songs", ["mobile", "email"], name: "index_user_songs_on_account", unique: true, using: :btree
  add_index "user_songs", ["mobile"], name: "index_user_songs_on_mobile", using: :btree
  add_index "user_songs", ["name"], name: "index_user_songs_on_name", unique: true, using: :btree
  add_index "user_songs", ["reset_password_token"], name: "index_user_songs_on_reset_password_token", unique: true, using: :btree
  add_index "user_songs", ["unlock_token"], name: "index_user_songs_on_unlock_token", unique: true, using: :btree

  create_table "user_zhaos", force: :cascade do |t|
    t.string   "name",                                                          null: false
    t.string   "mobile",                                          default: "",  null: false
    t.string   "email",                                           default: "",  null: false
    t.string   "encrypted_password",                              default: "",  null: false
    t.decimal  "balance",                precision: 10, scale: 2, default: 0.0, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                   default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                                 default: 0,   null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "user_zhaos", ["confirmation_token"], name: "index_user_zhaos_on_confirmation_token", unique: true, using: :btree
  add_index "user_zhaos", ["email"], name: "index_user_zhaos_on_email", using: :btree
  add_index "user_zhaos", ["mobile", "email"], name: "index_user_zhaos_on_account", unique: true, using: :btree
  add_index "user_zhaos", ["mobile"], name: "index_user_zhaos_on_mobile", using: :btree
  add_index "user_zhaos", ["name"], name: "index_user_zhaos_on_name", unique: true, using: :btree
  add_index "user_zhaos", ["reset_password_token"], name: "index_user_zhaos_on_reset_password_token", unique: true, using: :btree
  add_index "user_zhaos", ["unlock_token"], name: "index_user_zhaos_on_unlock_token", unique: true, using: :btree

  add_foreign_key "companies", "user_zhaos"
  add_foreign_key "contacts", "user_zhaos"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "contacts"
  add_foreign_key "jobs", "positions"
  add_foreign_key "jobs", "user_zhaos"
  add_foreign_key "labor_intentions", "labors"
  add_foreign_key "labors", "user_songs"
end
