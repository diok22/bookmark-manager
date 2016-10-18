require 'data_mapper'
require_relative 'data_mapper_setup'
require 'dm-postgres-adapter'

class Tag

    include DataMapper::Resource

    property :id,   Serial
    property :tag, String

end

data_mapper
