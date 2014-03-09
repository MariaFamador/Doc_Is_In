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

ActiveRecord::Schema.define(version: 20140309102209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "patient_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "doctor"
    t.datetime "starts_at"
    t.text     "notes"
    t.boolean  "cancel"
  end

  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "dosages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "medicine_id"
    t.integer  "patient_id"
    t.integer  "prescription_id"
    t.string   "prescribed_amount"
  end

  add_index "dosages", ["medicine_id"], name: "index_dosages_on_medicine_id", using: :btree
  add_index "dosages", ["patient_id"], name: "index_dosages_on_patient_id", using: :btree
  add_index "dosages", ["prescription_id"], name: "index_dosages_on_prescription_id", using: :btree

  create_table "medical_histories", force: true do |t|
    t.string   "allergies",                   default: [], array: true
    t.string   "previous_diseases",           default: [], array: true
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "medication_and_supplements"
    t.text     "family_history"
    t.text     "surgery_and_hospitalization"
  end

  add_index "medical_histories", ["patient_id"], name: "index_medical_histories_on_patient_id", using: :btree

  create_table "medicines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prescription_id"
    t.string   "name"
  end

  add_index "medicines", ["prescription_id"], name: "index_medicines_on_prescription_id", using: :btree

  create_table "patients", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "dob"
    t.integer  "age"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "doctor"
    t.string   "gender"
  end

  add_index "patients", ["user_id"], name: "index_patients_on_user_id", using: :btree

  create_table "prescription_guides", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "medicine_id"
    t.integer  "symptom_id"
  end

  add_index "prescription_guides", ["medicine_id"], name: "index_prescription_guides_on_medicine_id", using: :btree
  add_index "prescription_guides", ["symptom_id"], name: "index_prescription_guides_on_symptom_id", using: :btree

  create_table "prescriptions", force: true do |t|
    t.string   "diagnosis"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "patient_id"
    t.string   "patient_name"
    t.string   "doctor_name"
  end

  add_index "prescriptions", ["patient_id"], name: "index_prescriptions_on_patient_id", using: :btree
  add_index "prescriptions", ["user_id"], name: "index_prescriptions_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["account_id"], name: "index_roles_on_account_id", using: :btree
  add_index "roles", ["user_id"], name: "index_roles_on_user_id", using: :btree

  create_table "symptoms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prescription_id"
    t.string   "name"
  end

  add_index "symptoms", ["prescription_id"], name: "index_symptoms_on_prescription_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "middle_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
