db_config = YAML::load(File.read(RAILS_ROOT + "/config/database.yml"))

mongo = db_config[Rails.env]
  #MongoMapper.connection = Mongo::Connection.new(mongo['hostname'])
  #MongoMapper.database = mongo['database']
  #mongo = db_config[Rails.env]
MongoMapper.connection = Mongo::Connection.new(mongo['hostname'])
MongoMapper.database = mongo['database']

