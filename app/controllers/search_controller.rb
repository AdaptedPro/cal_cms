class SearchController < ApplicationController
	respond_to :html, :json, :xml

	def index

	end	

	def ajax_item_search
	    itemResults = ItemData.select('item_title, 
	    								item_viewable, 
	    								item_publish_date, 
	    								item_status').where('LCASE(item_data.item_title) || 
	    								LCASE(item_data.item_description) LIKE LCASE(?)', 
	    								params[:search])

	    #respond_to do |format|
		#	format.js { render :partial => 'itemTable', :collection => @itemResults, :layout => false }
		if !itemResults.blank?
			#format.html { render :partial => 'itemTable', :collection => @itemResults, :layout => false }
			#render :html => { partial => 'itemTable', :collection => itemResults }
			render :json => { :data => 'some' }
		else
			render :json => { :data => 'none' }
	    end	
	end
end
