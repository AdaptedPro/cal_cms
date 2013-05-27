class AuthUsersController < ApplicationController
  layout 'admin'
  before_filter :confirm_logged_in

  def index
  	list
  	render("list")
  end

  def list
  	@auth_user = AuthUser.sorted
  end

  def new
  	@auth_user = AuthUser.new
  end

  def create
  	@auth_user = AuthUser.new(params[:auth_user])
  	if @auth_user.save
  		flash[:notice] = 'Auth user created.'
  		redirect_to(:action => 'list')
  	else
  		render("new")
  	end
  end  

  def edit
  	@auth_user = AuthUser.find(params[:id])
  end
  
  def update
  	@auth_user = AuthUser.find(params[:id])
  	if @auth_user.update_attributes(params[:auth_user])
  		flash[:notice] = 'Auth user updated.'
  		redirect_to(:action => 'list')
  	else
  		render("edit")
  	end  	
  end

  def delete
  	@auth_user = AuthUser.find(params[:id])
  end

  def destroy
  	AuthUser.find(params[:id]).destroy
  	flash[:notice] = 'Auth user destroyed.'
  		redirect_to(:action => 'list')
  end  
end
