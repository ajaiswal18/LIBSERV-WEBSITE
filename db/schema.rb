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

ActiveRecord::Schema.define(version: 20150623072900) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "applicant_response_id", limit: 4
    t.integer  "question_id",           limit: 4
    t.string   "content",               limit: 255
    t.string   "desc_ans",              limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "applicant_responses", force: :cascade do |t|
    t.integer  "assessment_id", limit: 4
    t.integer  "question_id",   limit: 4
    t.integer  "answer_id",     limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "applicants", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "emailid",       limit: 255
    t.integer  "assessment_id", limit: 4
    t.string   "password",      limit: 255
    t.integer  "score",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "assessments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "test_code",  limit: 4
    t.integer  "test_time",  limit: 4
    t.string   "test_type",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "job_applicants", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "emailid",      limit: 255
    t.string   "contact_no",   limit: 255
    t.string   "applying_for", limit: 255
    t.string   "attachment",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "jobpostings", force: :cascade do |t|
    t.string   "S_No",            limit: 255
    t.date     "Posted_On"
    t.string   "Job_Title",       limit: 255
    t.string   "CTC",             limit: 255
    t.text     "Job_Description", limit: 65535
    t.text     "Experience_Req",  limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "assessment_id",  limit: 4
    t.text     "content",        limit: 65535
    t.string   "correct_answer", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id",               limit: 4
    t.integer  "assessment_id",         limit: 4
    t.integer  "question_id",           limit: 4
    t.integer  "answer_id",             limit: 4
    t.integer  "answerbyuser",          limit: 4
    t.integer  "applicant_response_id", limit: 4
    t.string   "response_text",         limit: 255
    t.string   "desc_answer",           limit: 255
    t.integer  "score",                 limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "shortlists", force: :cascade do |t|
    t.integer  "assessment_id",   limit: 4
    t.string   "assessment_code", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "test_scores", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "assessment_id", limit: 4
    t.integer  "score",         limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "assessment_id",          limit: 4
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255, default: "",      null: false
    t.string   "encrypted_password",     limit: 255, default: "",      null: false
    t.string   "role",                   limit: 255, default: "admin", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "shortlist_id",           limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
