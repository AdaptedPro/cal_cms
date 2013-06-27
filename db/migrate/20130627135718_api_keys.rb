class ApiKeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.integer "user_id"	  
	  t.string "public_key", :limit => 40, :null => false 
	  t.string "private_key", :limit => 40, :null => false 	  
      t.timestamps
    end
  end
end
