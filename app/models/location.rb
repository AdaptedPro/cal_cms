class Location < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :item_data
end
