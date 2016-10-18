require 'data_mapper'
require_relative 'data_mapper_setup'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id,   Serial
  property :title, String
  property :url, String
  property :tag, String

end
data_mapper
