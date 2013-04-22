class CreateItemTimeDates < ActiveRecord::Migration
  def change
    create_table :item_time_dates do |t|
      t.integer "item_id"
      t.time "start_time"
      t.time "end_time"
      t.date "start_date"
      t.date "end_date"      
      t.boolean "recurring_flag", :default => false
      t.integer "day_of_week", :limit => 1
      t.integer "day_of_month", :limit => 2 
      t.integer "week_of_month", :limit => 1
      t.timestamps
    end
    add_index("item_time_dates","item_id")
  end
end
