


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
    @activedeals_coupons = Array.new
    @inactivedeals_coupons = Array.new
  	@current_store = Stores.find_this_store(params[:store_id])
    options  = Hash.new
    options[:page] = params[:page]
    options[:per_page] = 2
  	@activedeals_of_store = Deals.find_activedeals_by_store(params[:store_id],options).to_a
    for active_deal in @activedeals_of_store
      store_short_code = Stores.get_short_code(active_deal.store_id)
      coup = Couponsstat.get_coupon( active_deal.shortcode , store_short_code )
      @h = Hash.new
      @h["deal"] = active_deal
      @h["coupon"] = coup
      @activedeals_coupons << @h
    end
    #options[:total_entries] = @activedeals_coupons.size
    #@activedeals_coupons_p =  @activedeals_coupons.paginate(options)
    options[:page] = params[:page]
    options[:per_page] = 2
    @inactivedeals_of_store = Deals.find_inactivedeals_by_store(params[:store_id],options).to_a
  	for inactive_deal in @inactivedeals_of_store
      store_short_code = Stores.get_short_code(inactive_deal.store_id)
      coup = Couponsstat.get_coupon( inactive_deal.shortcode , store_short_code )
      @h = Hash.new
      @h["deal"] = inactive_deal
      @h["coupon"] = coup
      @inactivedeals_coupons << @h
    end
    #options[:total_entries] = @inactivedeals_coupons.size
    #@inactivedeals_coupons_p = @inactivedeals_coupons.paginate(options)
  end


  def storelist

    

  end
end
