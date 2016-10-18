require 'sinatra/base'
require './app/models/link'
class BookmarkManager < Sinatra::Base
  # include DataMapper::Resource
  # property :id,   Serial
  # property :website, String
  # property :link, String


  get '/' do
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
