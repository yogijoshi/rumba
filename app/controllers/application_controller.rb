class ApplicationController < ActionController::Base


  before_filter :parse_facebook_cookies
  def parse_facebook_cookies
    # = Koala::Facebook::OAuth.new('201875599851846', 'e3ce956f923f21edb8fcbba30237f41a')
    @facebook_cookies = Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
   
  end
  def oauth_consumer
    @oauth_consumer ||= OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
  end

end
