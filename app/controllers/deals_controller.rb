class DealsController < ApplicationController
  
  def all

   # @all = Deals.all
   # @one = Deals.where(:_id => '4d872f69b56739f621000000').first

#    active = Deals.new
#    @abc = active.get_active_deals
#    @c= active.get_deals_by_catergory('hot')

    deal = Deals.new
    @store = Stores.new
    @coupon = Couponstat.new

    @activedeal = deal.get_active_deals
    
    

  end

end



