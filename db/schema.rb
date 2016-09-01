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

ActiveRecord::Schema.define(version: 20160831063020) do

  create_table "admins", force: :cascade do |t|
    t.string   "adminname",       limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "login",           limit: 255
    t.string   "auth",            limit: 255
    t.integer  "status",          limit: 4
  end

  create_table "answers", force: :cascade do |t|
    t.string   "asnwer",      limit: 255
    t.integer  "isright",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "question_id", limit: 4
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "chapter",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cpuids", force: :cascade do |t|
    t.string   "cpuid",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "errquests", force: :cascade do |t|
    t.integer  "amount",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id",     limit: 4
    t.integer  "question_id", limit: 4
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "license",     limit: 255
    t.integer  "cpuid_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "licensenum",  limit: 4
    t.string   "licensetime", limit: 255
    t.integer  "licensetype", limit: 4
  end

  create_table "progres", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "question_id", limit: 4
  end

  create_table "questions", force: :cascade do |t|
    t.string   "questionname",               limit: 255
    t.string   "isjudge",                    limit: 255
    t.string   "driverlicensetype",          limit: 255
    t.string   "questiontype",               limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "chapter_id",                 limit: 4
    t.integer  "subject_id",                 limit: 4
    t.integer  "isnew",                      limit: 4
    t.string   "questionimage_file_name",    limit: 255
    t.string   "questionimage_content_type", limit: 255
    t.integer  "questionimage_file_size",    limit: 4
    t.datetime "questionimage_updated_at"
    t.string   "voice_file_name",            limit: 255
    t.string   "voice_content_type",         limit: 255
    t.integer  "voice_file_size",            limit: 4
    t.datetime "voice_updated_at"
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "score",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "settings", force: :cascade do |t|
    t.string   "autormerr",           limit: 255
    t.string   "showerrcount",        limit: 255
    t.string   "model",               limit: 255
    t.string   "password",            limit: 255
    t.string   "prescore",            limit: 255
    t.string   "driverschoolname",    limit: 255
    t.string   "contact",             limit: 255
    t.string   "addre",               limit: 255
    t.string   "introduction",        limit: 255
    t.integer  "testbenchnumber",     limit: 4
    t.string   "driverschoolpicture", limit: 255
    t.string   "province",            limit: 255
    t.string   "poweron",             limit: 255
    t.string   "closepassword",       limit: 255
    t.string   "shownotification",    limit: 255
    t.string   "softwaretitle",       limit: 255
    t.string   "hidedriverlicense",   limit: 255
    t.string   "hidesetting",         limit: 255
    t.string   "textreplace",         limit: 255
    t.string   "scrollingtext",       limit: 255
    t.string   "functionalmodule",    limit: 255
    t.string   "subjiectmodule",      limit: 255
    t.string   "learningmodule",      limit: 255
    t.string   "displaytest",         limit: 255
    t.string   "reshuffling",         limit: 255
    t.string   "autoclear",           limit: 255
    t.string   "subjectfourbutton",   limit: 255
    t.string   "registrationprocess", limit: 255
    t.string   "paymentlink",         limit: 255
    t.string   "customerserviceQQ",   limit: 255
    t.string   "customerserviceWW",   limit: 255
    t.string   "comment",             limit: 255
    t.string   "registrationdisplay", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "score",               limit: 255
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "subject",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "updatechecks", force: :cascade do |t|
    t.string   "updatecheck", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",       limit: 255
    t.string   "password",    limit: 255
    t.string   "head",        limit: 255
    t.string   "studentid",   limit: 255
    t.string   "sex",         limit: 255
    t.integer  "age",         limit: 4
    t.integer  "idcard",      limit: 4
    t.string   "name",        limit: 255
    t.string   "money",       limit: 255
    t.string   "model",       limit: 255
    t.string   "Subject",     limit: 255
    t.string   "logintype",   limit: 255
    t.integer  "loginnumber", limit: 4
    t.string   "logintime",   limit: 255
    t.string   "status",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
