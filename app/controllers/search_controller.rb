class SearchController < ApplicationController

	def index

	end	

	def ajax_item
	    @itemResults = ItemData.select('distinct item_title, 
	    								item_viewable, 
	    								item_publish_date, 
	    								item_status').where('LCASE(item_data.item_title) || 
	    								LCASE(item_data.item_description) LIKE LCASE(?)', 
	    								'%'+params[:search]+'%')
	    respond_to do |format|
			format.js { render :partial => 'itemTable', :collection => @itemResults, :layout => false }
	    end	
	end
end
