class Deals

  include MongoMapper::Document
  PAGINATOR = 2
  def self.find_activedeals_by_store(store_id, pagination_options)
  
  	deals =  Deals.where(:status => 'active', :store_id => store_id).paginate(pagination_options)

  end
  
  def self.find_inactivedeals_by_store(store_id,pagination_options)
  
  	deals =  Deals.where(:status => 'over', :store_id => store_id).paginate(pagination_options)

  end
  
  def self.get_active_deals

    deals =  Deals.where(:status => 'active')

  end

  def get_deals_by_catergory (category)

    deals =  Deals.where(:deal_type => category)

  end   


 def self.get_store_id(deal_id)

  deal = Deals.find(deal_id)
  deal.store_id
 end

 def self.get_short_code(deal_id)

  deal = Deals.find(deal_id)
  deal.shortcode
 end
 
 def self.get_deal_by_id(deal_id)

   Deals.find(deal_id)
   
 end
  
end
