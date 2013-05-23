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

ActiveRecord::Schema.define(:version => 20130519171521) do

  create_table "auth_user_pages", :id => false, :force => true do |t|
    t.integer "auth_user_id"
    t.integer "page_id"
  end

  add_index "auth_user_pages", ["auth_user_id", "page_id"], :name => "index_auth_user_pages_on_auth_user_id_and_page_id"

  create_table "auth_users", :force => true do |t|
    t.string   "first_name",  :limit => 25
    t.string   "last_name",   :limit => 50
    t.string   "email",                     :default => "", :null => false
    t.string   "displayname", :limit => 40,                 :null => false
    t.string   "password",    :limit => 40,                 :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "contact_title",        :limit => 5
    t.string   "contact_first_name",   :limit => 20
    t.string   "contact_last_name",    :limit => 40
    t.string   "contact_email",        :limit => 40
    t.integer  "contact_phone"
    t.string   "contact_organization", :limit => 40
    t.string   "created_by",           :limit => 40
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "item_data", :force => true do |t|
    t.integer  "timedate_id"
    t.integer  "item_id"
    t.integer  "contact_id"
    t.integer  "location_id"
    t.integer  "parking_id"
    t.string   "permalink"
    t.string   "item_title",        :limit => 40
    t.text     "item_description"
    t.text     "item_special_note", :limit => 255
    t.boolean  "item_viewable",                    :default => false
    t.date     "item_publish_date"
    t.string   "item_status",       :limit => 8
    t.string   "created_by",        :limit => 40
    t.string   "item_password",     :limit => 40
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "item_data", ["contact_id"], :name => "index_item_data_on_contact_id"
  add_index "item_data", ["item_id"], :name => "index_item_data_on_item_id"
  add_index "item_data", ["location_id"], :name => "index_item_data_on_location_id"
  add_index "item_data", ["parking_id"], :name => "index_item_data_on_parking_id"
  add_index "item_data", ["permalink"], :name => "index_item_data_on_permalink"
  add_index "item_data", ["timedate_id"], :name => "index_item_data_on_timedate_id"

  create_table "item_time_dates", :force => true do |t|
    t.integer  "item_id"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "recurring_flag",              :default => false
    t.integer  "day_of_week",    :limit => 1
    t.integer  "day_of_month",   :limit => 2
    t.integer  "week_of_month",  :limit => 1
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "item_time_dates", ["item_id"], :name => "index_item_time_dates_on_item_id"

  create_table "items", :force => true do |t|
    t.string   "item_name",  :limit => 50, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "location_address_1", :limit => 40
    t.string   "location_address_2", :limit => 40
    t.string   "location_city",      :limit => 40
    t.string   "location_state",     :limit => 20
    t.string   "location_zip",       :limit => 10
    t.string   "location_country",   :limit => 60
    t.string   "location_abbr",      :limit => 10
    t.float    "location_lat"
    t.float    "location_lng"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "options", :force => true do |t|
    t.string   "option_name",  :limit => 50
    t.string   "option_value", :limit => 125
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "created_by",   :limit => 40
  end

  create_table "pages", :force => true do |t|
    t.integer  "subject_id"
    t.string   "page_name",  :limit => 50, :null => false
    t.string   "permalink"
    t.integer  "position"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "pages", ["subject_id"], :name => "index_pages_on_subject_id"

  create_table "parkings", :force => true do |t|
    t.text     "parking_details", :limit => 255
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "created_by",      :limit => 40
  end

  create_table "section_edits", :force => true do |t|
    t.integer  "auth_user_id"
    t.integer  "section_id"
    t.string   "summary"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "section_edits", ["auth_user_id", "section_id"], :name => "index_section_edits_on_auth_user_id_and_section_id"

  create_table "sections", :force => true do |t|
    t.integer  "page_id"
    t.string   "section_name", :limit => 50,                    :null => false
    t.boolean  "visible",                    :default => false
    t.integer  "position"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "sections", ["page_id"], :name => "index_sections_on_page_id"

  create_table "splashes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "subject_name", :limit => 50,                    :null => false
    t.boolean  "visible",                    :default => false
    t.integer  "position"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",  :limit => 25
    t.string   "last_name",   :limit => 50
    t.string   "email",                     :default => "", :null => false
    t.string   "displayname", :limit => 40,                 :null => false
    t.string   "password",    :limit => 40,                 :null => false
    t.string   "status",      :limit => 8,                  :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

end
