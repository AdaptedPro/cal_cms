class Contact < ActiveRecord::Base
  attr_accessible :contact_title, :contact_first_name, :contact_last_name, :contact_email, :contact_phone, :user_id
  #set_table_name("if renaming")
  
  belongs_to :item_data

  scope :order, order("contact_last_name ASC").limit(10)
  scope :search, lambda {|query| where(["contact_first_name || contact_last_name || contact_organization LIKE ?", "%#{query}%"])}
end
