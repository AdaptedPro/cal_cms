class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string "subject_name", :limit => 50, :null => false   	
      t.boolean "visible", :default => false
      t.integer "position" 
      t.timestamps
    end
  end
end
