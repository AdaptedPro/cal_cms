class ItemTimeDate < ActiveRecord::Base
  attr_accessible :id, :start_date, :end_date, :start_time, :end_time #:title, :body

  belongs_to :item_data
end
