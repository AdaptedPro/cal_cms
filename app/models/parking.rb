class Parking < ActiveRecord::Base
  attr_accessible :parking_details

  belongs_to :item_data
end
