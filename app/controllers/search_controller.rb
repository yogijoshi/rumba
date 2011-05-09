class SearchController < ApplicationController
  
  def search

   
   
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
