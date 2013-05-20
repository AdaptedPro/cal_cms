class Subject < ActiveRecord::Base
  attr_accessible :subject_name, :visible, :position 
  #:title, :body

  has_many :pages
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
