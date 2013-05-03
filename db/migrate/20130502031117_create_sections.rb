class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer "page_id"	
      t.string "section_name", :limit => 50, :null => false   	
      t.boolean "visible", :default => false
      t.integer "position" 
      t.timestamps
    end
    add_index("sections", "page_id")
  end
end
