class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string "contact_title", :limit => 5
      t.string "contact_first_name", :limit => 20
      t.string "contact_last_name", :limit => 40
      t.string "contact_email", :limit => 40
      t.integer "contact_phone", :limit => 20
      t.string "contact_organization", :limit => 40
      t.string "created_by", :limit => 40      
      t.timestamps
    end
  end
end
