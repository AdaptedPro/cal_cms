class CreateAuthUsers < ActiveRecord::Migration
  def change
    create_table :auth_users do |t|

      t.timestamps
    end
  end
end
