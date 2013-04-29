class Contact < ActiveRecord::Base
  #attr_accessible :contact_last_name
  #set_table_name("if renaming")
  
  scope :order, order("contact_last_name ASC").limit(10)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
  
end
