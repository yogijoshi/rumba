class Couponstat

 include MongoMapper::Document

  def get_coupon ( deal_short_code , store_short_code )

    c = Couponstat.where(:dealshortcode => deal_short_code ,:storeshortcode => store_short_code ).first
 

    if c.nil?

      return 0

    else

      return c

    end
  end

end