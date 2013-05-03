class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "page_name", :limit => 50, :null => false   	
      t.string "permalink"
      t.integer "position"     
      t.timestamps
    end
    add_index("pages", "subject_id")
  end
end
