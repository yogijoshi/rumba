class Deals

  include MongoMapper::Document
  plugin Hunt
  key :title, String
  key :category, Array
  key :deal_type, String
  key :description,  String

  searches :title, :category, :deal_type, :description
  def self.search_deals(search_string,page)
    Deals.search(search_string).paginate(:page => page, :per_page => 5)
  end

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

 def self.search_deal_name(query)

     return Deals.where( :title => Regexp.new(query) )
   
 end

 def self.group 

   @archive = Deals.collection.group(
  "function(x) { return { month: x.datetime.getMonth(), year:x.datetime.getFullYear() }; }",
  nil, { :count => 0 }, 'function(x,y){y.count++}', true)

 end


end
