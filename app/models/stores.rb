class Stores

  include MongoMapper::Document
  plugin Hunt
  key :address1, String
  key :address2, String
  key :categories,  Array
  key :tags,  String
  key :city, String
  key :pin_code, String
  key :email, String

  searches :address1, :address2, :categories, :tags, :city, :pin_code, :email

  def self.get_related_stores(search_string,pagenum)
     Stores.search(search_string).paginate(:page => pagenum, :per_page => 2)
  end

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


