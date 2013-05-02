class CreateAuthUsersPagesJoin < ActiveRecord::Migration
  def up
  	create_table :auth_user_pages, :id => false do |t|
  		t.integer "auth_user_id"
  		t.integer "page_id"
  	end
  	add_index :auth_user_pages, ["auth_user_id","page_id"]	
  end

  def down
  	drop_table :auth_user_pages
  end
end
