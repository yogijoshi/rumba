class DealsController < ApplicationController
  
  def get_deal_details
    begin
      deal_id = params[:deal_id]
      @deal = Deals.get_deal_by_id(deal_id)
      store_short_code = Stores.get_short_code(@deal.store_id)
      @coup = Couponsstat.get_coupon( @deal.shortcode , store_short_code )
      raise 'test error'
    rescue e
      redirect_to(:controller => 'error', :action => 'showerror', :message => e.message)
    end
  end
  def get_deal
    if current_user
      #get_deal call to PHP SERVICE
    else
      redirect_url = ''
    end
  end
end



