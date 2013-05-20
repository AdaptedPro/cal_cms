class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #Retrieve from FB if allowed
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "displayname", :limit => 40, :null => false
      t.string "password", :limit => 40, :null => false
      t.string "status", :limit => 8, :null => false	
      t.timestamps
    end
  end
end
 