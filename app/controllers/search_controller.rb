class SearchController < ApplicationController
  
  def search

   query = params[:q]  

    if ! query.nil?

      query ="^"+ query.to_s
      
      @dr = Deals.search_deal_name(query)

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
