class Location < ActiveRecord::Base
  attr_accessible :location_address_1, :location_address_2, :location_city, :location_state, :location_zip, :location_country, :location_abbr, :location_lat, :location_lng

  belongs_to :item_data
end
