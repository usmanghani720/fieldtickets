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

ActiveRecord::Schema.define(version: 20160421232338) do

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

  create_table "timesheet_employee_entries", force: :cascade do |t|
    t.integer  "timesheet_timesheet_id"
    t.integer  "employee_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "minutes_worked"
    t.boolean  "per_diem"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "timesheet_employee_entries", ["employee_id"], name: "index_timesheet_employee_entries_on_employee_id", using: :btree
  add_index "timesheet_employee_entries", ["timesheet_timesheet_id"], name: "index_timesheet_employee_entries_on_timesheet_timesheet_id", using: :btree

  create_table "timesheet_scaffold_entries", force: :cascade do |t|
    t.integer  "timesheet_timesheet_id"
    t.integer  "equipment_id"
    t.integer  "fuel_gallons"
    t.integer  "mileage_start"
    t.integer  "mileage_end"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "timesheet_scaffold_entries", ["equipment_id"], name: "index_timesheet_scaffold_entries_on_equipment_id", using: :btree
  add_index "timesheet_scaffold_entries", ["timesheet_timesheet_id"], name: "index_timesheet_scaffold_entries_on_timesheet_timesheet_id", using: :btree

  create_table "timesheet_timesheets", force: :cascade do |t|
    t.integer  "field_ticket_id"
    t.integer  "site_supervisor_id"
    t.integer  "crew_chief_id"
    t.boolean  "finalized"
    t.text     "project"
    t.text     "supplies_teeth"
    t.text     "supplies_oil"
    t.text     "supplies_holders"
    t.text     "supplies_other"
    t.datetime "left_job_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "timesheet_timesheets", ["crew_chief_id"], name: "index_timesheet_timesheets_on_crew_chief_id", using: :btree
  add_index "timesheet_timesheets", ["field_ticket_id"], name: "index_timesheet_timesheets_on_field_ticket_id", using: :btree
  add_index "timesheet_timesheets", ["site_supervisor_id"], name: "index_timesheet_timesheets_on_site_supervisor_id", using: :btree

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
  add_foreign_key "timesheet_employee_entries", "employees"
  add_foreign_key "timesheet_employee_entries", "timesheet_timesheets"
  add_foreign_key "timesheet_scaffold_entries", "equipment"
  add_foreign_key "timesheet_scaffold_entries", "timesheet_timesheets"
  add_foreign_key "timesheet_timesheets", "field_tickets"
end
