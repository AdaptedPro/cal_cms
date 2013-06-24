class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :status
  attr_accessor :password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates_presence_of :first_name
  validates_length_of :first_name, :maximum => 25
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 50  
  validates_presence_of :email
  validates_length_of :email, :maximum => 255
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :email
  validates_presence_of :password
  validates_length_of :password, :within => 5..25, :on => :create
  
  before_save :create_hashed_password
  after_save :clear_password

  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("users.last_name ASC, users.first_name ASC")
  attr_protected :hashed_password, :salt 

  def name
	"#{first_name} #{last_name}"
  end

  def self.authenticate(email="", password="")
  	user = User.find_by_email(email)
  	if user && user.password_match?(password)
  		return user
  	else
  		return false
  	end
  end

  def password_match?(password="")
  	hashed_password == User.hash_with_salt(password, salt)
  end

  def self.make_salt(email="")
  	Digest::SHA1.hexdigest("Use #{email} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
  	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private
  def create_hashed_password
  	#Due when :password has value
  	unless password.blank?
  		#Use self when assigning values
  		self.salt = User.make_salt(email) if salt.blank?
  		self.hashed_password = User.hash_with_salt(password, salt)
  	end
  end

  def clear_password
  	#For security because hashing is not needed
  	self.password = nil
  end 

  def self.make_auth_from_user(hash_email="")
      sql = "INSERT INTO auth_users ( 
          first_name
          ,last_name
          ,email
          ,hashed_password
          ,salt
          ) SELECT
          first_name
          ,last_name
          ,email
          ,hashed_password
          ,salt
          FROM users
          WHERE users.email = '#{hash_email}'
          AND users.status = 'Join'"

      records_array = ActiveRecord::Base.connection.execute(sql)
      return records_array
  end

end
