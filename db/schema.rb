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

ActiveRecord::Schema.define(version: 20170507041619) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "adminname"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "login"
    t.string   "auth"
    t.integer  "status"
  end

  create_table "answers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "asnwer"
    t.integer  "isright"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
  end

  create_table "avaters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "topavater_file_name"
    t.string   "topavater_content_type"
    t.integer  "topavater_file_size"
    t.datetime "topavater_updated_at"
    t.string   "leftavater_file_name"
    t.string   "leftavater_content_type"
    t.integer  "leftavater_file_size"
    t.datetime "leftavater_updated_at"
  end

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "chapter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "flag"
  end

  create_table "clas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "chapter_id"
    t.integer  "subject_id"
    t.string   "classflag"
    t.string   "questiontype"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "cartype"
  end

  create_table "classdetails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "cla_id"
    t.string   "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cpuids", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "cpuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "errquests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "question_id"
  end

  create_table "leftavatars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "leftavatar_file_name"
    t.string   "leftavatar_content_type"
    t.integer  "leftavatar_file_size"
    t.datetime "leftavatar_updated_at"
    t.string   "link"
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "license"
    t.integer  "cpuid_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "licensenum"
    t.string   "licensetime"
    t.integer  "licensetype"
  end

  create_table "loginlogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
  end

  create_table "progres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "questionname"
    t.string   "isjudge"
    t.string   "driverlicensetype"
    t.string   "questiontype"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "chapter_id"
    t.integer  "subject_id"
    t.integer  "isnew"
    t.string   "questionimage_file_name"
    t.string   "questionimage_content_type"
    t.integer  "questionimage_file_size"
    t.datetime "questionimage_updated_at"
    t.string   "voice_file_name"
    t.string   "voice_content_type"
    t.integer  "voice_file_size"
    t.datetime "voice_updated_at"
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "autormerr"
    t.string   "showerrcount"
    t.string   "model"
    t.string   "password"
    t.string   "prescore"
    t.string   "driverschoolname"
    t.string   "contact"
    t.string   "addre"
    t.string   "introduction"
    t.integer  "testbenchnumber"
    t.string   "driverschoolpicture"
    t.string   "province"
    t.string   "poweron"
    t.string   "closepassword"
    t.string   "shownotification"
    t.string   "softwaretitle"
    t.string   "hidedriverlicense"
    t.string   "hidesetting"
    t.string   "textreplace"
    t.string   "scrollingtext"
    t.string   "functionalmodule"
    t.string   "subjiectmodule"
    t.string   "learningmodule"
    t.string   "displaytest"
    t.string   "reshuffling"
    t.string   "autoclear"
    t.string   "subjectfourbutton"
    t.string   "registrationprocess"
    t.string   "paymentlink"
    t.string   "customerserviceQQ"
    t.string   "customerserviceWW"
    t.string   "comment"
    t.string   "registrationdisplay"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "score"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topavatars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "topavatar_file_name"
    t.string   "topavatar_content_type"
    t.integer  "topavatar_file_size"
    t.datetime "topavatar_updated_at"
    t.string   "link"
  end

  create_table "updatechecks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "updatecheck"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "login"
    t.string   "password"
    t.string   "head"
    t.string   "studentid"
    t.string   "sex"
    t.integer  "age"
    t.string   "idcard"
    t.string   "name"
    t.string   "money"
    t.string   "model"
    t.string   "Subject"
    t.string   "logintype"
    t.integer  "loginnumber"
    t.string   "logintime"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "remoteval"
    t.string   "education"
    t.string   "phonenumber"
    t.string   "part"
    t.integer  "admin_id"
  end

end
