module FbconnectHelper

  def index

    require 'facebooker'

    session = Facebooker::Session::Desktop.create('c55703414ddb7fcd59662f5a35f52743', '75b2c7b2e2075f66024dd18fa1f24e3b')
    
  end
end
