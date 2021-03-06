class UserMailer < ActionMailer::Base
  default from: "noreply@cirrusera.com"

  def confirm_email(user)
    @user = user
    @url  = "http://cirrusera.com/account/confirm/?e=#{user.email}"
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

  def recover_email(auth_user,hash)
    @url  = "http://cirrusera.com/account/reset/?h=#{hash}&e=#{auth_user.email}"
    mail(:to => user.email, :subject => "Changing your password for Cirrus Era")   
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
