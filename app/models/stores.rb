class Stores

  include MongoMapper::Document   
  def self.get_all_stores
   #debugger
   name="Deals"
   s = Stores.all
  end


 def self.get_all_active_stores

   s = Stores.where( :status => 1 )

 end
 
 def self.get_all_inactive_stores

   s = Stores.where( :status => 0 )

 end

 def self.get_short_code(store_id)

   Stores.find(store_id).shortcode

 end

 def self.find_this_store(store_id)
   
   s = Stores.find(store_id)
 end

 def self.get_store_list(alphabet)
   
   alphabet.to_s
   alphabet = "^" + alphabet

   Stores.where(:store_name => Regexp.new(alphabet)).sort(:store_name.asc)
 end

 
end


