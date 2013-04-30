class Contact < ActiveRecord::Base
  #attr_accessible :contact_last_name
  #set_table_name("if renaming")
  
  scope :order, order("contact_last_name ASC").limit(10)
  scope :search, lambda {|query| where(["contact_first_name || contact_last_name || contact_organization LIKE ?", "%#{query}%"])}
  
end
