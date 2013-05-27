class ApplicationController < ActionController::Base
  protect_from_forgery

	protected
	def confirm_logged_in
		unless session[:user_id]
			flash[:notice] = "Please log in"
			redirect_to(:controller => 'account', :action => 'signin')
			return false #halt before filter
		else
			return true
		end
	end	

end
