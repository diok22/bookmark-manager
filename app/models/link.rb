require 'data_mapper'
require 'dm-postgres-adapter'


class Link
  include DataMapper::Resource
  
  property :id,   Serial
  property :title, String
  property :url, String

end


DataMapper.setup(:default, 'postgres://LaurentBo:password@127.0.0.1/bookmark_manager_test')
DataMapper.finalize
DataMapper.auto_upgrade!
