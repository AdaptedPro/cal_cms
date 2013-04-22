class CreateItemData < ActiveRecord::Migration
  def change
    create_table :item_data do |t|
      t.integer "timedate_id"
      t.integer "item_id"
      t.integer "contact_id"
      t.integer "location_id"
      t.integer "parking_id"
      t.string "permalink"
      t.string "item_title", :limit => 40
      t.text "item_description", :limit => 300
      t.text "item_special_note", :limit => 150
      t.boolean "item_viewable", :default => false
      t.date "item_publish_date"
      t.string "item_status", :limit => 8
      t.integer "parking_id"
      t.string "created_by", :limit => 40
      t.string "item_password", :limit => 40
      t.timestamps
    end
    add_index("item_data", "item_id")   
    add_index("item_data", "timedate_id")
    add_index("item_data", "contact_id")
    add_index("item_data", "location_id")
    add_index("item_data", "parking_id")
    add_index("item_data", "permalink")
  end
end
