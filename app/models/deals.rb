class Deals

  include MongoMapper::Document

  def self.find_activedeals_by_store(store_id)
  
  	deals =  Deals.where(:status => 'active', :store_id => store_id)

  end
  
  def self.find_inactivedeals_by_store(store_id)
  
  	deals =  Deals.where(:status => 'inactive', :store_id => store_id)

  end
  
  def self.get_active_deals

    deals =  Deals.where(:status => 'active')

  end

  def get_deals_by_catergory (category)

    deals =  Deals.where(:deal_type => category)

  end   



 def get_all_deals

   deals =  Deals.all
   
 end

 def get_store_id(deal_id)

  deals = Deals.find(deal_id)

 end

 def get_short_code(deal_id)

  deals = Deals.find(deal_id)

 end
  
end
