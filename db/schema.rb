# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100913184707) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.boolean  "featured"
    t.boolean  "approved"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "moderator_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "long_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_maps", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "match_id"
    t.integer  "map_id"
  end

  create_table "matches", :force => true do |t|
    t.datetime "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "category_id"
    t.integer  "event_id"
    t.integer  "user_id"
  end

  create_table "players", :force => true do |t|
    t.string   "firstname"
    t.string   "surname"
    t.string   "nickname"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "roles_mask"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "birthdate"
    t.string   "city"
    t.text     "description"
    t.string   "firstname"
    t.string   "surname"
    t.string   "headset"
    t.string   "mousepad"
    t.string   "keyboard"
    t.string   "mouse"
    t.string   "monitor"
    t.string   "motherboard"
    t.string   "cpu"
    t.string   "graphicscard"
    t.string   "memory"
    t.string   "hdd"
    t.string   "gamepad"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
