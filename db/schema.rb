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

ActiveRecord::Schema.define(version: 20140901173255) do

  create_table "admin_permissions", force: true do |t|
    t.string   "permission_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
    t.integer  "stuid"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_permission_id"
    t.integer  "gender_id"
    t.integer  "society_id"
    t.integer  "sl_department_id"
    t.string   "icon_url"
    t.text     "proverb"
    t.string   "contact"
    t.string   "name"
    t.string   "admin_pic_file_name"
    t.string   "admin_pic_content_type"
    t.integer  "admin_pic_file_size"
    t.datetime "admin_pic_updated_at"
  end

  add_index "admin_users", ["admin_permission_id"], name: "index_admin_users_on_admin_permission_id"
  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["gender_id"], name: "index_admin_users_on_gender_id"
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  add_index "admin_users", ["sl_department_id"], name: "index_admin_users_on_sl_department_id"
  add_index "admin_users", ["society_id"], name: "index_admin_users_on_society_id"

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "issue_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "dep_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_society"
  end

  create_table "editable_areas", force: true do |t|
    t.string   "title",      null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "editable_areas", ["title"], name: "index_editable_areas_on_title"

  create_table "faqs", force: true do |t|
    t.string   "query"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genders", force: true do |t|
    t.string   "gender_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "home_backgrounds", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ava_pic_file_name"
    t.string   "ava_pic_content_type"
    t.integer  "ava_pic_file_size"
    t.datetime "ava_pic_updated_at"
  end

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id"

  create_table "issue_images", force: true do |t|
    t.integer  "issue_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "issue_pic_file_name"
    t.string   "issue_pic_content_type"
    t.integer  "issue_pic_file_size"
    t.datetime "issue_pic_updated_at"
    t.integer  "society_id"
  end

  create_table "issues", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_url"
    t.string   "author"
    t.integer  "category_id"
    t.string   "issue_pic_file_name"
    t.string   "issue_pic_content_type"
    t.integer  "issue_pic_file_size"
    t.datetime "issue_pic_updated_at"
    t.integer  "society_id"
    t.integer  "issue_catch_counter"
  end

  add_index "issues", ["category_id"], name: "index_issues_on_category_id"
  add_index "issues", ["society_id"], name: "index_issues_on_society_id"

  create_table "items", force: true do |t|
    t.string   "item_name"
    t.string   "item_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materials", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "members", force: true do |t|
    t.integer  "memid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.string   "msg_content"
    t.string   "msg_font"
    t.string   "msg_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noti_attends", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "stuid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stu_society"
    t.string   "stu_contact"
    t.integer  "noti_id"
    t.integer  "user_id"
  end

  create_table "notis", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "society_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "in_members"
    t.boolean  "in"
    t.string   "location"
    t.integer  "num_attend"
    t.integer  "num_maybe"
    t.integer  "noti_catch_counter"
  end

  create_table "sl_departments", force: true do |t|
    t.string   "sl_dep_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", force: true do |t|
    t.string   "society_name"
    t.integer  "department_id"
    t.integer  "num_member"
    t.integer  "num_registered_member"
    t.string   "home_url"
    t.boolean  "is_outstanding"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "history"
    t.string   "profile"
    t.string   "president"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "sub_faqs", force: true do |t|
    t.string   "query"
    t.text     "answer",     limit: 255
    t.integer  "faq_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subitems", force: true do |t|
    t.string   "subitem_name"
    t.string   "subitem_url"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timetables", force: true do |t|
    t.integer  "user_id"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "noti_name"
    t.string   "noti_location"
    t.boolean  "remind"
    t.integer  "noti_id"
  end

  create_table "user_behaviors", force: true do |t|
    t.integer  "user_id"
    t.integer  "issue_id"
    t.integer  "noti_id"
    t.integer  "material_id"
    t.integer  "impression_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_societies", force: true do |t|
    t.integer  "user_id"
    t.integer  "society_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_societies", ["society_id"], name: "user_societies_society_id_fk"
  add_index "user_societies", ["user_id", "society_id"], name: "index_user_societies_on_user_id_and_society_id", unique: true

  create_table "users", force: true do |t|
    t.integer  "stuid"
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "contact"
    t.text     "proverb"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.integer  "member_id"
    t.boolean  "is_active",           default: true, null: false
    t.integer  "gender_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_society_id"
  end

  add_index "users", ["gender_id"], name: "index_users_on_gender_id"
  add_index "users", ["member_id"], name: "index_users_on_member_id"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["user_society_id"], name: "index_users_on_user_society_id"

end
