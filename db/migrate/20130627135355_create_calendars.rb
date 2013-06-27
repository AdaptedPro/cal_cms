class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.integer "user_id"
      t.string "calendar_name", :limit => 50      
      t.timestamps
    end
  end
end
