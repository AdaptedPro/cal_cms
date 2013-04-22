class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string "location_title", :limit => 40
      t.string "location_address_1", :limit => 40
      t.string "location_address_2", :limit => 40
      t.string "location_city", :limit => 40
      t.string "location_state", :limit => 20
      t.string "location_zip", :limit => 10
      t.string "location_country", :limit => 60
      t.string "location_abbr", :limit => 10
      t.decimal "location_lat", :limit => 15
      t.decimal "location_lng", :limit => 15
	  t.timestamps
    end
  end
end
