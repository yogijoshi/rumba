#db_config = YAML::load(File.read(RAILS_ROOT + "/config/database.yml"))
#
#mongo = db_config[Rails.env]
#  #MongoMapper.connection = Mongo::Connection.new(mongo['hostname'])
#  #MongoMapper.database = mongo['database']
#  #mongo = db_config[Rails.env]
#MongoMapper.connection = Mongo::Connection.new(mongo['hostname'])
#MongoMapper.database = mongo['database']

db_config = YAML::load(File.read(RAILS_ROOT + "/config/database.yml"))

begin

    config = db_config[Rails.env]

    MongoMapper.connection = Mongo::Connection.new(config['hostname'], config['port'])
    MongoMapper.database = config['database']
    if config['authenticate'] == true
      MongoMapper.database.authenticate(config['username'], config['password'])
    end

rescue => e
  puts "Custom Error by tejas: Could not connect to MongoDB or read config: #{e}"
  exit
end
