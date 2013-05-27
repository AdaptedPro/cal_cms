class CreateAuthUsers < ActiveRecord::Migration
  def change
    create_table :auth_users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "displayname", :limit => 40, :null => false
      t.string "hashed_password", :limit => 40, :null => false 
      t.string "salt", :limit => 40, :null => false      
      t.timestamps
    end
  end
end
