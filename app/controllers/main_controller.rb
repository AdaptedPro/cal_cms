class MainController < ApplicationController
	layout 'application'
	def index
		if !session[:user_id].blank?
			redirect_to(:controller => 'dashboard', :action => 'index')
		else		
			welcome
			render('welcome')
		end	
	end

	def welcome
		@event = ItemData.where('user_id = ?', session[:user_id])	
		@locations = Location.where('(SELECT COUNT(*) FROM item_data WHERE item_data.location_id = locations.id
											AND item_data.user_id = ?)', session[:user_id])				
	end

	def about
		render('about')
	end	

	def business
		render('business')
	end		

	def developers
		render('developers')
	end	

	def help
		render('help')
	end	

	def privacy
		render('privacy')
	end		

	def terms
		render('terms')
	end	

	def facebook
		if params[:verified] == 'true' && params[:link].start_with?('https://www.facebook.com/')
			#@auth_user = AuthUser.where('email = ?', params[:email])
			#if !@auth_user.blank?
			#	#@auth_user.fb_id = params[:]
			#else
			#	session[:user_id]
			#end
			session[:user_id] = params[:id]
			session[:email] = params[:email]
			session[:fb] = true

			@usr = AuthUser.find_by_id(session[:user_id])

			if @usr.blank?
				@usr = AuthUser.new
				@usr.first_name = params[:first_name]
				@usr.last_name = params[:last_name]
				@user.hashed_password = Digest::SHA1.hexdigest(params[:password])
				@user.email = params[:email]
				@user.salt = params[:username]
			else
			end

			render :json => { :reply => 'good' }
		else
			render :json => { :reply => 'bad' }		
		end
	end

end
