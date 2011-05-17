# Load the rails application
require File.expand_path('../application', __FILE__)
APP_CONFIG = YAML::load(File.read(RAILS_ROOT + "/config/twitter.yml"))[Rails.env]
# Initialize the rails application
Mongo::Application.initialize!



