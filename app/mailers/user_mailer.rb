class UserMailer < ActionMailer::Base
  default from: "noreply@cirrusera.com"

  def confirm_email(user)
    @user = user
    @url  = "http://cirrusera.com/confirm/<%= Digest::SHA1.hexdigest(user.email)%>"
    mail(:to => user.email, :subject => "Confirm your account on Cirrus Era")
  end 

  def welcome_email(user)
    @user = user
    @url  = "http://cirrusera.com/signin"
    mail(:to => user.email, :subject => "Welcome to Cirrus Era")
  end  

  def password_change_email(user)
  	@user = user
    mail(:to => user.email, :subject => "Password for Cirrus Era has been changed")  	
  end

  def account_closed_email(user)   
  	@user = user
    mail(:to => user.email, :subject => "Your Cirrus Era has been closed")    	
  end

  def digest_email(user)
  	@user = user
    mail(:to => user.email, :subject => "Calendar Digest")     	
  end

end
