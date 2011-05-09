class Search

  include MongoMapper::Document

  key :keywords , String
  key :count , Integer

end

