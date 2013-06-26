class ItemData < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :item_title, :item_description, :item_viewable, :item_special_note

  has_one :item_time_date
  has_one :location
  has_one :parking
  has_many :contacts

  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

  def self.search_item_by_term(term="",user="")
  	sql = "SELECT DISTINCT 
      I.item_title, I.item_viewable, I.item_viewable, I.item_status 
			FROM item_data I 
			WHERE LCASE(I.item_title)   
			LIKE LCASE('%#{term}%') 
			OR LCASE(I.item_description)  
			LIKE LCASE('%#{term}%') 
  		OR LCASE(I.item_special_note) 
  		LIKE LCASE('%#{term}%')
      AND user_id = '#{user}'"

      records_array = ActiveRecord::Base.connection.execute(sql)
      return records_array
  end
end
