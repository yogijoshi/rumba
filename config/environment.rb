# Load the rails application
require File.expand_path('../application', __FILE__)
APP_CONFIG = YAML.load(File.open("C:/rails_project/rumba/rumba/config/twitter.yml","r").read)
# Initialize the rails application
Mongo::Application.initialize!



