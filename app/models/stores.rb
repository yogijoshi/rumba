class Stores

  include MongoMapper::Document   

 def get_all_stores

   s = Stores.all

   if s.nil?

     return 0

   else

     return s

   end

 end


 def get_all_active_stores

   s = Stores.where( :status => 1 )

   if s.nil?

     return 0

   else

     return s

   end

 end

 def get_short_code(store_id)

   s = Stores.find(store_id )

   if s.nil?

     return 0

   else

     return s.shortcode

   end

 end

end


