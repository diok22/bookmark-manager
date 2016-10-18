ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'models/link'
require_relative "models/tag"
require_relative 'models/data_mapper_setup'
class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'link_new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title], tag: (params[:tag]))
    Tag.create(tag: (params[:tag]))
    redirect '/links'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
