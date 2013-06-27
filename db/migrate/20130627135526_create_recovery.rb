class Recovery < ActiveRecord::Migration
  def change
    create_table :recovery do |t|
	  t.string "email"
	  t.boolean "recovered", :default => false  
	  t.string "recovery_hash", :limit => 40, :null => false 
      t.timestamps
    end
  end
end
