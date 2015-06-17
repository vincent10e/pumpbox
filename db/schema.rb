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

ActiveRecord::Schema.define(version: 20150617022844) do

  create_table "answer_records", force: :cascade do |t|
    t.integer  "test_attempt_id", limit: 4
    t.integer  "test",            limit: 4
    t.integer  "answer",          limit: 4
    t.integer  "error_times",     limit: 4, default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.integer  "volume_number", limit: 4
    t.integer  "subject_id",    limit: 4
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "concepts", force: :cascade do |t|
    t.integer  "subject_id",       limit: 4
    t.integer  "volume_number",    limit: 4
    t.integer  "chapter_id",       limit: 4
    t.string   "title",            limit: 255
    t.text     "description",      limit: 65535
    t.string   "video",            limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "lecture",          limit: 255
    t.integer  "target_course_id", limit: 4
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "teacher_id",         limit: 4
    t.string   "title",              limit: 255
    t.text     "overview",           limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "education_level_id", limit: 4
    t.integer  "subject_id",         limit: 4
    t.integer  "group_id",           limit: 4
  end

  create_table "customized_concepts", force: :cascade do |t|
    t.integer  "course_id",   limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "video",       limit: 255
    t.string   "lecture",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "education_levels", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "teacher_id", limit: 4
    t.string   "name",       limit: 255
    t.string   "group_code", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer  "test_id",     limit: 4
    t.string   "description", limit: 255
    t.boolean  "is_answer",   limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "student_groupships", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "students", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "username",   limit: 255
    t.date     "birth"
    t.string   "school",     limit: 255
    t.integer  "gender",     limit: 4
    t.integer  "grade",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "education_level_id", limit: 4
  end

  create_table "target_courses", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "username",     limit: 255
    t.string   "service_unit", limit: 255
    t.date     "birth"
    t.integer  "gender",       limit: 4
    t.string   "suject",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "test_attempts", force: :cascade do |t|
    t.integer  "customized_concept_id", limit: 4
    t.integer  "user",                  limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "test_record_attempts", force: :cascade do |t|
    t.integer  "test_record_id", limit: 4
    t.integer  "test_id",        limit: 4
    t.integer  "retry_time",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "customized_concept_id", limit: 4
    t.text     "question",              limit: 65535
    t.string   "tip",                   limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "related_video",         limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
