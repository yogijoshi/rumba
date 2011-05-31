class SearchController < ApplicationController
  
  def search
   begin
     query = params[:query]
     @my_email = params[:email]
      if ! query.nil?

       # query ="^"+ query.to_s

        @stores= Stores.get_related_stores(query,params[:page])
        @deals = Deals.search_deals(query, params[:page])
      end

      if @stores.empty? and @deals.empty?
        raise "No results found"
      end
      @activedeals_coupons = Array.new
      for active_deal in @deals
        if active_deal.status == 'active'
          store_short_code = Stores.get_short_code(active_deal.store_id)
          coup = Couponsstat.get_coupon( active_deal.shortcode , store_short_code )
          @h = Hash.new
          @h["deal"] = active_deal
          @h["coupon"] = coup
          @activedeals_coupons << @h
        end
      end
    rescue Exception => e
       redirect_to(:controller => 'error', :action => 'showerror', :message => e.message)
    end
  end


  def create

    c =[ :keywords => 'new' , :count => 1 ,:somefield =>' pqr']
    abc c

    render :text => 'done'

  end

  def abc array

    Search.create( array )

  end
end
