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

ActiveRecord::Schema.define(:version => 20110218200437) do

  create_table "advert_positions", :force => true do |t|
    t.string   "name"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adverts", :force => true do |t|
    t.integer  "advert_position_id"
    t.string   "type"
    t.text     "code"
    t.string   "url"
    t.string   "company"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "positions_mask"
    t.string   "category"
  end

  create_table "album_comments", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "album_id"
    t.integer  "album_photo_id"
  end

  create_table "album_photos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "album_id"
  end

  create_table "album_ratings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "album_id"
    t.integer  "rating"
  end

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "click_count", :default => 0
  end

  create_table "article_comments", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "article_id"
  end

  create_table "article_editors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "update_type", :default => "Edited"
  end

  create_table "article_ratings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating",     :limit => 10, :precision => 10, :scale => 0, :default => 3
    t.integer  "user_id"
    t.integer  "article_id"
  end

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
    t.text     "preamble"
    t.integer  "click_count",        :default => 0
    t.integer  "news_category_id"
    t.string   "lang",               :default => "English"
    t.boolean  "momentnews"
  end

  create_table "awards", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "place"
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "preamble"
  end

  create_table "brackets", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "long_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "small_icon_file_name"
    t.string   "small_icon_content_type"
    t.integer  "small_icon_file_size"
    t.datetime "small_icon_updated_at"
    t.integer  "ok_team_id"
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "album_id"
    t.integer  "article_id"
    t.integer  "match_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_photo_id"
    t.integer  "event_id"
    t.integer  "blog_id"
  end

  create_table "event_editors", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_teams", :force => true do |t|
    t.integer  "position"
    t.integer  "team_id"
    t.integer  "bracket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "round"
    t.integer  "match_id"
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
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "format_id"
    t.boolean  "has_groups",              :default => false
    t.boolean  "has_brackets",            :default => false
    t.boolean  "team_event",              :default => true
    t.string   "large_logo_file_name"
    t.string   "large_logo_content_type"
    t.integer  "large_logo_file_size"
    t.datetime "large_logo_updated_at"
    t.integer  "click_count",             :default => 0
    t.text     "information"
  end

  create_table "formats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_teams", :force => true do |t|
    t.integer  "group_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stage"
  end

  create_table "insider_events", :force => true do |t|
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "insider_id"
  end

  create_table "insider_files", :force => true do |t|
    t.integer  "category_id"
    t.integer  "insider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "name"
  end

  create_table "insider_prizes", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "product_link"
    t.integer  "insider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insider_servers", :force => true do |t|
    t.string   "country"
    t.string   "name"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "insider_id"
  end

  create_table "insiders", :force => true do |t|
    t.text     "description"
    t.text     "faq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knockout_matches", :force => true do |t|
    t.integer  "match_id"
    t.integer  "position"
    t.integer  "column"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", :force => true do |t|
    t.string   "firstname"
    t.string   "surname"
    t.string   "nickname"
    t.string   "role"
    t.integer  "user_id"
    t.text     "short_description"
    t.boolean  "is_high_management"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "match_editors", :force => true do |t|
    t.integer  "match_id"
    t.integer  "user_id"
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

  create_table "match_players", :force => true do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "team1_score",              :default => 0
    t.integer  "team2_score",              :default => 0
    t.text     "results"
    t.string   "map_picture_file_name"
    t.string   "map_picture_content_type"
    t.integer  "map_picture_file_size"
    t.datetime "map_picture_updated_at"
    t.integer  "format_id"
    t.integer  "group_id"
    t.boolean  "featured"
    t.integer  "click_count"
  end

  create_table "messages", :force => true do |t|
    t.integer  "from_id"
    t.integer  "receiver_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",        :default => false
    t.integer  "parent_id"
  end

  create_table "news_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ok_players", :force => true do |t|
    t.string   "firstname"
    t.string   "surname"
    t.string   "nickname"
    t.integer  "user_id"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "short_description"
    t.integer  "category_id"
    t.string   "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "is_staff"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_link"
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "white_logo_file_name"
    t.string   "white_logo_content_type"
    t.integer  "white_logo_file_size"
    t.datetime "white_logo_updated_at"
    t.boolean  "featured"
    t.string   "website"
    t.boolean  "prime",                   :default => true
  end

  create_table "players", :force => true do |t|
    t.string   "firstname"
    t.string   "surname"
    t.string   "nickname"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.date     "birth_date"
    t.integer  "user_id"
    t.integer  "category_id"
  end

  create_table "prints", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_file_size"
    t.string   "image_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "streams", :force => true do |t|
    t.string   "title"
    t.integer  "event_id"
    t.string   "channel"
    t.text     "details"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments"
    t.datetime "on_at"
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
    t.integer  "player_id"
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
    t.string   "country"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
    t.integer  "user_id"
  end

end
