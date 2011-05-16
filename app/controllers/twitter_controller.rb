class TwitterController < ApplicationController
  def index
  end

  def login
    #oauth.set_callback_url("http://localhost:3000/twitter/finalize")
    
    request_token = oauth_consumer.get_request_token(:oauth_callback => "http://localhost:3000/twitter/finalize")
    session[:request_token] = request_token.token
    session[:request_secret] = request_token.secret
    redirect_url = request_token.authorize_url
    redirect_url = "http://"+ redirect_url unless redirect_url.match(/^http:\/\//)
    redirect_to redirect_url
  end

  def finalize
    request_token = OAuth::RequestToken.new(oauth_consumer, session['request_token'], session['request_secret'])
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    reset_session
    session['access_token'] = access_token.token
    session['access_secret'] = access_token.secret
    @tuser = client.verify_credentials
    #session[:screen_name] = tuser.screen_name if tuser
  end
  private
  def client
    Twitter.configure do |config|
      config.consumer_key = "Gabi9MYs3DYHuWMb28vBIg"
      config.consumer_secret = "YLSBzdgCEz2bgSeYA81BM7BJ3xvuPTC4velsm3RHF0"
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client = Twitter::Client.new
  end
  def oauth_consumer
    @oauth_consumer = OAuth::Consumer.new( "Gabi9MYs3DYHuWMb28vBIg",
                                           "YLSBzdgCEz2bgSeYA81BM7BJ3xvuPTC4velsm3RHF0",
                                            :site => 'http://api.twitter.com',
                                            :request_endpoint => 'http://api.twitter.com',
                                            :sign_in => true)
  end
end
