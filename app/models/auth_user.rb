require 'digest/sha1'
class AuthUser < ActiveRecord::Base
  attr_accessible #:title, :body
  attr_accessor :password
 
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :section, :through => :section_edits

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_presence_of :first_name
  validates_length_of :first_name, :maximum => 25
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 50  
  validates_presence_of :displayname
  validates_length_of :displayname, :within => 7..40
  validates_uniqueness_of :displayname
  validates_presence_of :email
  validates_length_of :email, :maximum => 255
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :email

  validates_length_of :password, :within => 8..25, :on => :create
  
  before_save :create_hashed_password
  after_save :clear_password

  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("auth_users.last_name ASC, auth_users.first_name ASC")
  attr_protected :hashed_password, :salt 

  def name
	"#{first_name} #{last_name}"
  end

  def self.authenticate(displayname="", password="")
  	user = AuthUser.find_by_displayname(displayname)
  	if user && user.password_match?(password)
  		return user
  	else
  		return false
  	end
  end

  def password_match?(password="")
  	hashed_password == AuthUser.hash_with_salt(password, salt)
  end

  def self.make_salt(displayname="")
  	Digest::SHA1.hexdigest("Use #{displayname} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
  	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private
  def create_hashed_password
  	#Due when :password has value
  	unless password.blank?
  		#Use self when assigning values
  		self.salt = AuthUser.make_salt(displayname) if salt.blank?
  		self.hashed_password = AuthUser.hash_with_salt(password, salt)
  	end
  end

  def clear_password
  	#For security because hashing is not needed
  	self.password = nil
  end

end