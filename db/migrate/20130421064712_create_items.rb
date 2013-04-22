class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string "item_name", :limit => 50, :null => false
      t.timestamps
    end
  end
end
