class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string "page_name", :limit => 50, :null => false   	
      t.string "permalink"
      t.integer "position"     
      t.timestamps
    end
  end
end
