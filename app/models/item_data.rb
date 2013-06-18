class ItemData < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :item_title, :item_description, :item_viewable

  has_one :location
  has_one :parking
  has_many :contacts

  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
