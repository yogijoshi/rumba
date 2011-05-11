class Couponsstat

 include MongoMapper::Document

  def self.get_coupon ( deal_short_code , store_short_code )

    Couponsstat.where(:dealshortcode => deal_short_code ,:storeshortcode => store_short_code ).first
 
  end

end