class DealsController < ApplicationController
  
  def get_deal_details

   # @all = Deals.all
   # @one = Deals.where(:_id => '4d872f69b56739f621000000').first

#    active = Deals.new
#    @abc = active.get_active_deals
#    @c= active.get_deals_by_catergory('hot')

    deal_id = params[:deal_id]
    @deal = Deals.get_deal_by_id(deal_id)
    store_short_code = Stores.get_short_code(@deal.store_id)
    @coup = Couponsstat.get_coupon( @deal.shortcode , store_short_code )
    
  end

end



