require 'digest/sha1'
class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :first_name, :last_name, :email, :hashed_password

    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
