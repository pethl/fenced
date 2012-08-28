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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120810152951) do

  create_table "dilemmas", :force => true do |t|
    t.string   "uuid",            :limit => 36
    t.string   "title"
    t.text     "dilemma"
    t.string   "status"
    t.string   "ans_opt"
    t.string   "shorten_url"
    t.datetime "close_timestamp"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "dilemmas", ["user_id", "created_at"], :name => "index_dilemmas_on_user_id_and_created_at"

  create_table "responses", :force => true do |t|
    t.string   "option"
    t.string   "yes"
    t.string   "no"
    t.string   "user"
    t.integer  "dilemma_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "twitter_name"
  end

  add_index "responses", ["dilemma_id"], :name => "index_responses_on_dilemma_id"

  create_table "users", :force => true do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "twittername"
    t.string   "yob"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
