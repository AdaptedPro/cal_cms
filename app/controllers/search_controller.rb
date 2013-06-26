class SearchController < ApplicationController
	respond_to :html, :json, :xml

	def index

	end	

	def ajax_item_search
		#@results = ItemData.search_item_by_term(params[:search],session[:user_id])	    	
	    @results = ItemData.where("LCASE(item_title) LIKE LCASE(?) OR
	    						   LCASE(item_description) LIKE LCASE(?) OR
	    						   LCASE(item_special_note) LIKE LCASE(?)	
	    						   AND user_id = ?", 
	    							"%#{params[:search]}%","%#{params[:search]}%",
	    							"%#{params[:search]}%", session[:user_id])	
	   
	    if !@results.blank?
			render partial: "itemSearchResults", :locals => { :collection => @results }
			#render :json => { :data => @results }
		else
			render partial: "itemSearchResultsEmpty"
			#render :json => { :data => 'none' }
	    end	
	end
end
