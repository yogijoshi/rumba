


class StoresController < ApplicationController
 
  def relatedstores

  	@all = Stores.get_all_stores
  
  end
  
  def activestores
  	
  	@activescore = Stores.get_all_active_stores
  end	
  
  def inactivestores
  	
  	@activescore = Stores.get_all_inactive_stores
  end	
  
  def get_store_details
    #debugger
  	@current_store = Stores.find_this_store(params[:store_id])
  	
  	@activedeals_of_store = Deals.find_activedeals_by_store(params[:store_id]).to_a
  	
 # 	store_short_code = Stores.get_short_code(params[:store_id])
 # 	
 #       coup = Coupons.get_coupon(active.shortcode, store_short_code)

  end
  
end
