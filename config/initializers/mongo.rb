db_config = YAML::load(File.read(RAILS_ROOT + "/config/database.yml"))

if db_config[Rails.env] && db_config[Rails.env]['adapter'] == 'mongodb'
  #mongo = db_config[Rails.env]
  #MongoMapper.connection = Mongo::Connection.new(mongo['hostname'])
  #MongoMapper.database = mongo['database']
  #mongo = db_config[Rails.env]
  MongoMapper.connection = Mongo::Connection.new("178.79.145.128")
  MongoMapper.database = "dealtadka_live"
end

