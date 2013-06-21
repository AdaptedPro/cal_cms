class MainController < ApplicationController
	layout 'application'
	def index
		welcome
		render('welcome')
	end

	def welcome
		if !session[:user_id].blank?
			redirect_to(:controller => 'dashboard', :action => 'index')
		else
			@event = ItemData.all
			@event = ItemData.order	

			@locations = Location.all;
			@locations = Location.order;	
		end			
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
