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

ActiveRecord::Schema.define(version: 20160511200239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.text     "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree

  create_table "employee_entries", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "field_ticket_id"
    t.text     "status",              default: "idle"
    t.datetime "time"
    t.integer  "duration_in_minutes"
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "employee_entries", ["deleted_at"], name: "index_employee_entries_on_deleted_at", using: :btree
  add_index "employee_entries", ["employee_id"], name: "index_employee_entries_on_employee_id", using: :btree
  add_index "employee_entries", ["field_ticket_id"], name: "index_employee_entries_on_field_ticket_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.text     "name"
    t.text     "nickname"
    t.text     "internal_number"
    t.text     "display_name"
    t.boolean  "worker"
    t.boolean  "crew_chief"
    t.boolean  "manager"
    t.text     "email"
    t.text     "encrypted_password"
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0, null: false
    t.text     "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "employees", ["deleted_at"], name: "index_employees_on_deleted_at", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.text     "internal_number"
    t.text     "description"
    t.text     "vehicle_type"
    t.text     "display_name"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "equipment", ["deleted_at"], name: "index_equipment_on_deleted_at", using: :btree

  create_table "equipment_entries", force: :cascade do |t|
    t.integer  "field_ticket_id"
    t.boolean  "rental"
    t.integer  "equipment_id"
    t.text     "rental_description"
    t.text     "status",              default: "idle"
    t.decimal  "fuel_gallons"
    t.decimal  "mileage"
    t.datetime "time"
    t.integer  "duration_in_minutes"
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "equipment_entries", ["deleted_at"], name: "index_equipment_entries_on_deleted_at", using: :btree
  add_index "equipment_entries", ["equipment_id"], name: "index_equipment_entries_on_equipment_id", using: :btree
  add_index "equipment_entries", ["field_ticket_id"], name: "index_equipment_entries_on_field_ticket_id", using: :btree

  create_table "field_tickets", force: :cascade do |t|
    t.integer  "job_id"
    t.text     "bill_to",                         default: "Job"
    t.boolean  "is_non_job",                      default: false
    t.datetime "started_at"
    t.datetime "finished_at"
    t.boolean  "customer_approved_work"
    t.text     "customer_name_and_title"
    t.text     "customer_feedback"
    t.text     "supplies_teeth"
    t.text     "supplies_oil"
    t.text     "supplies_holders"
    t.text     "supplies_other"
    t.integer  "length"
    t.integer  "width"
    t.decimal  "depth"
    t.text     "delays_trucks"
    t.text     "delays_paving"
    t.text     "delays_mot"
    t.text     "delays_other"
    t.datetime "deleted_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "customer_signature_file_name"
    t.string   "customer_signature_content_type"
    t.integer  "customer_signature_file_size"
    t.datetime "customer_signature_updated_at"
  end

  add_index "field_tickets", ["deleted_at"], name: "index_field_tickets_on_deleted_at", using: :btree
  add_index "field_tickets", ["job_id"], name: "index_field_tickets_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.text     "internal_number"
    t.text     "customers_number"
    t.boolean  "flat_rate",        default: false
    t.boolean  "completed",        default: false
    t.integer  "customer_id"
    t.text     "display_name"
    t.datetime "deleted_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id", using: :btree
  add_index "jobs", ["deleted_at"], name: "index_jobs_on_deleted_at", using: :btree

  add_foreign_key "employee_entries", "employees"
  add_foreign_key "employee_entries", "field_tickets"
  add_foreign_key "equipment_entries", "equipment"
  add_foreign_key "equipment_entries", "field_tickets"
  add_foreign_key "field_tickets", "jobs"
  add_foreign_key "jobs", "customers"
end
