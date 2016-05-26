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

ActiveRecord::Schema.define(version: 20160526154330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["deleted_at"], name: "index_customers_on_deleted_at", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "internal_number"
    t.string   "display_name"
    t.boolean  "worker"
    t.boolean  "crew_chief"
    t.boolean  "manager"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0, null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "employees", ["deleted_at"], name: "index_employees_on_deleted_at", using: :btree

  create_table "field_tickets", force: :cascade do |t|
    t.integer  "job_id"
    t.text     "bill_to",                         default: "Job"
    t.datetime "submitted_at"
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
    t.integer  "customer_id"
    t.string   "internal_number"
    t.string   "customers_number"
    t.integer  "billing",          default: 0
    t.integer  "status",           default: 0
    t.string   "display_name"
    t.datetime "deleted_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "jobs", ["customer_id"], name: "index_jobs_on_customer_id", using: :btree
  add_index "jobs", ["deleted_at"], name: "index_jobs_on_deleted_at", using: :btree

  create_table "ticket_employees", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ticket_employees", ["employee_id"], name: "index_ticket_employees_on_employee_id", using: :btree
  add_index "ticket_employees", ["ticket_id"], name: "index_ticket_employees_on_ticket_id", using: :btree

  create_table "ticket_tickets", force: :cascade do |t|
    t.integer  "bill_to",                         default: 0
    t.integer  "job_id"
    t.integer  "approval",                        default: 0
    t.string   "approval_name_and_title"
    t.string   "approval_email"
    t.text     "approval_feedback"
    t.integer  "supplies_teeth"
    t.decimal  "supplies_oil"
    t.integer  "supplies_holders"
    t.text     "supplies_notes"
    t.integer  "milling_length"
    t.integer  "milling_width"
    t.decimal  "milling_depth"
    t.decimal  "delays_trucks"
    t.decimal  "delays_paving"
    t.decimal  "delays_mot"
    t.decimal  "delays_other"
    t.text     "delays_notes"
    t.datetime "finalized_at"
    t.datetime "deleted_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "approval_signature_file_name"
    t.string   "approval_signature_content_type"
    t.integer  "approval_signature_file_size"
    t.datetime "approval_signature_updated_at"
  end

  add_index "ticket_tickets", ["deleted_at"], name: "index_ticket_tickets_on_deleted_at", using: :btree
  add_index "ticket_tickets", ["finalized_at"], name: "index_ticket_tickets_on_finalized_at", using: :btree
  add_index "ticket_tickets", ["job_id"], name: "index_ticket_tickets_on_job_id", using: :btree

  create_table "ticket_vehicles", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ticket_vehicles", ["ticket_id"], name: "index_ticket_vehicles_on_ticket_id", using: :btree
  add_index "ticket_vehicles", ["vehicle_id"], name: "index_ticket_vehicles_on_vehicle_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "internal_number"
    t.string   "description"
    t.string   "vehicle_type"
    t.string   "display_name"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "vehicles", ["deleted_at"], name: "index_vehicles_on_deleted_at", using: :btree

  add_foreign_key "field_tickets", "jobs"
  add_foreign_key "jobs", "customers"
  add_foreign_key "ticket_tickets", "jobs"
end
