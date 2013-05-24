class ItemTimeDate < ActiveRecord::Base
  attr_accessible :id #:title, :body

  belongs_to :item_data
end
