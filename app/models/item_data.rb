class ItemData < ActiveRecord::Base
  # attr_accessible :title, :body

  scope :search, lambda{|query| where(["name LIKE ?", "%#{{query}}%"])}
end
