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

ActiveRecord::Schema.define(:version => 20110823021610) do

  create_table "artists", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "bio",          :limit => 255
    t.string   "origin"
    t.string   "years_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "downloads", :force => true do |t|
    t.integer  "artist_id"
    t.string   "title"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filetype"
  end

  create_table "links", :force => true do |t|
    t.integer  "user_id"
    t.string   "label"
    t.text     "href"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["created_at"], :name => "index_microposts_on_created_at"
  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "shows", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "when"
    t.string   "where"
    t.string   "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "who"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
