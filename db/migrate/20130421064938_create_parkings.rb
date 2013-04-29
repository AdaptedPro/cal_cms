class CreateParkings < ActiveRecord::Migration
  def change
    create_table :parkings do |t|
     t.text "parking_details", :limit => 125
     t.timestamps
     t.string "created_by", :limit => 40
    end
  end
end
