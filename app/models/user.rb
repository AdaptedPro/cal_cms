class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :hashed_password
  attr_accessor :password

end
