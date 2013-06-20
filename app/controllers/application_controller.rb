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

	protected
	def confirm_has_private_key
		unless session[:private_key]
			flash[:notice] = "Please double check that you have the correct private key in place."
			redirect_to(:controller => 'dashboard', :action => 'index')
			return false
		else
			return true
		end
	end	

end
