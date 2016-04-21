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

ActiveRecord::Schema.define(version: 20160421213141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.text     "name"
    t.text     "internal_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.text     "internal_number"
    t.text     "license_plate_number"
    t.text     "vin"
    t.text     "vehicle_type"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "field_tickets", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "non_job_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.boolean  "customer_approved_work"
    t.text     "customer_name_and_title"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "customer_signature_file_name"
    t.string   "customer_signature_content_type"
    t.integer  "customer_signature_file_size"
    t.datetime "customer_signature_updated_at"
  end

  add_index "field_tickets", ["job_id"], name: "index_field_tickets_on_job_id", using: :btree
  add_index "field_tickets", ["non_job_id"], name: "index_field_tickets_on_non_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.text     "internal_number"
    t.text     "customers_number"
    t.boolean  "flat_rate"
    t.integer  "customer_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id", using: :btree

  create_table "non_jobs", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "field_tickets", "jobs"
  add_foreign_key "field_tickets", "non_jobs"
  add_foreign_key "jobs", "customers"
end
