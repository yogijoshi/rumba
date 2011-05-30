require 'digest/md5'
class FacebookinfoController < ApplicationController
  def index
      @graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])
      #@likes = graph.get_connections("me", "likes").to_
      #@mehash = @graph.get_object("me")

      if Dealtadkauser.find_by_uid(@facebook_cookies["uid"]) == true
         flash[:message] = "user already exists"
      else
        user_hash = create_user_hash_fromfb()
      end
      user_data = @graph.get_object("me")
      session[:email] = user_data["email"]
      redirect_to( request.referer + "&store_id=" + params[:store_id] + "&email=" + user_data["email"])
  end
  def login
  end
  def create_user_hash_fromfb
    user_details = @graph.get_object("me")
    t = Time.now()
    user_hash = {
                  :birthday => user_details["birthday"],
                  :created => "%.0f" % t.to_f,
                  :modified => "%.0f" % t.to_f,
                  :status => "1",
                  :created_detail =>
                    {
                      :seconds => t.sec,
                      :minutes => t.min,
                      :hours   => t.hour,
                      :mday    => t.day,
                      :wday    => t.wday,
                      :mon     => t.month,
                      :year    => t.year,
                      :yday    => t.yday,
                      :weekday => t.strftime('%A'),
                      :month   => t.strftime('%b')
                    },
                  :email =>
                    {
                      :id => user_details["email"],
                      :code => "0",
                      :verified => "0"
                    },
                  :facebook =>
                    {
                      :access_token => @facebook_cookies["access_token"],
                      :uid => @facebook_cookies["uid"],
                      :permissions => "user_birthday,email,user_location,read_stream,publish_stream,offline_access,manage_pages",
                    },
                  :fbid => @facebook_cookies["uid"],
                  :first_name => user_details["first_name"],
                  :gender => user_details["gender"],
                  :last_name => user_details["last_name"],
                  :link => user_details["link"],
                  :locale => user_details["locale"],
                  :name => user_details["name"],
                  :timezone => user_details["timezone"],
                  :type => "USER",
                  :updated_time => user_details["updated_time"]
                }
      if Dealtadkauser.create(user_hash)
        flash[:message] = "user created successfully"
      else
        flash[:message] = "user not created"
      end  
  end
end