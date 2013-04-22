class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string "option_name", :limit => 50
      t.string "option_value", :limit => 125	
      t.timestamps
    end
  end
end
