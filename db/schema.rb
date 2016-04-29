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

ActiveRecord::Schema.define(version: 20160427195452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "procedure_id",                  null: false
    t.string   "status",       default: "Open", null: false
    t.boolean  "completed",    default: false,  null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "active_stage", default: 1,      null: false
  end

  add_index "apps", ["procedure_id", "user_id"], name: "index_apps_on_procedure_id_and_user_id", unique: true, using: :btree
  add_index "apps", ["procedure_id"], name: "index_apps_on_procedure_id", using: :btree
  add_index "apps", ["user_id"], name: "index_apps_on_user_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "document_name",                          null: false
    t.text     "description"
    t.string   "completion_status", default: "Accepted", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "icons", force: :cascade do |t|
    t.string "name",     null: false
    t.string "icon_img", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.integer  "procedure_id", null: false
    t.integer  "stage_id",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "order",        null: false
  end

  add_index "levels", ["procedure_id", "stage_id"], name: "index_levels_on_procedure_id_and_stage_id", unique: true, using: :btree
  add_index "levels", ["procedure_id"], name: "index_levels_on_procedure_id", using: :btree
  add_index "levels", ["stage_id"], name: "index_levels_on_stage_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.integer  "stage_id",    null: false
    t.integer  "document_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "materials", ["document_id"], name: "index_materials_on_document_id", using: :btree
  add_index "materials", ["stage_id", "document_id"], name: "index_materials_on_stage_id_and_document_id", unique: true, using: :btree
  add_index "materials", ["stage_id"], name: "index_materials_on_stage_id", using: :btree

  create_table "procedures", force: :cascade do |t|
    t.string   "procedure_name",                         null: false
    t.text     "description"
    t.string   "completion_status", default: "Complete", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string   "stage_name",                             null: false
    t.text     "description"
    t.string   "completion_status", default: "Approved", null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "app_id",                           null: false
    t.integer  "user_id",                          null: false
    t.integer  "stage_id",                         null: false
    t.boolean  "accepted",         default: false, null: false
    t.boolean  "ready_for_review", default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "order",                            null: false
  end

  add_index "steps", ["app_id"], name: "index_steps_on_app_id", using: :btree
  add_index "steps", ["stage_id"], name: "index_steps_on_stage_id", using: :btree
  add_index "steps", ["user_id", "app_id", "stage_id"], name: "index_steps_on_user_id_and_app_id_and_stage_id", unique: true, using: :btree
  add_index "steps", ["user_id"], name: "index_steps_on_user_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.string   "document_file"
    t.integer  "document_id",                      null: false
    t.integer  "user_id",                          null: false
    t.integer  "app_id",                           null: false
    t.integer  "step_id",                          null: false
    t.boolean  "accepted",         default: false, null: false
    t.boolean  "ready_for_review", default: false, null: false
    t.boolean  "flagged",          default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "icon_id",          default: 5
  end

  add_index "uploads", ["app_id"], name: "index_uploads_on_app_id", using: :btree
  add_index "uploads", ["document_id"], name: "index_uploads_on_document_id", using: :btree
  add_index "uploads", ["step_id"], name: "index_uploads_on_step_id", using: :btree
  add_index "uploads", ["user_id", "app_id", "step_id", "document_id"], name: "index_uploads_on_user_id_and_app_id_and_step_id_and_document_id", unique: true, using: :btree
  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                  null: false
    t.string   "encrypted_password",                     null: false
    t.string   "user_name",                              null: false
    t.boolean  "malicious",              default: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
