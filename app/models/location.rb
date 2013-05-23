class Location < ActiveRecord::Base
  attr_accessible :id, :location_address_1, :location_title #:title, :body

  belongs_to :item_data
end
