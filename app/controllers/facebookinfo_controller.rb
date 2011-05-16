class FacebookinfoController < ApplicationController
  def index2
       @oa = Koala::Facebook::OAuth.new('201875599851846', 'e3ce956f923f21edb8fcbba30237f41a')

       @o = @oa.get_user_info_from_cookies(cookies)
       @oauth = @oa.get_user_from_cookies(cookies)

       @graph = Koala::Facebook::GraphAPI.new()
       @gr=@graph.get_object("koppel")
  end
  def index
      graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])
      @likes = graph.get_connections("me", "likes").to_a
  end
  def login
  end
end
