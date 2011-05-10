class Deals

  include MongoMapper::Document


  def get_active_deals

    deals =  Deals.where(:status => 'active')

    if deals.nil?

      return 0

    else

     return deals

    end

  end

  def get_deals_by_catergory (category)

    deals =  Deals.where(:deal_type => category)

    if deals.nil?

      return 0

    else

     return deals

    end

  end   



 def get_all_deals

   deals =  Deals.all

    if deals.nil?

      return 0

    else

     return deals

    end
  
 end

 def get_store_id(deal_id)

  deals = Deals.find(deal_id)

   if deals.nil?

     return 0

   else

     return deals.store_id

   end

 end

 def get_short_code(deal_id)

  deals = Deals.find(deal_id)

   if deals.nil?

     return 0

   else

     return deals.shortcode

   end

 end
  
end
