class Page < ActiveRecord::Base
   attr_accessible :page_name, :permalink, :position

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AuthUser"
end
