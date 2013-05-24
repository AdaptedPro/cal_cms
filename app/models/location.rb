class Location < ActiveRecord::Base
  attr_accessible :id, :location_address_1, :location_city #:title, :body

  belongs_to :item_data
end
