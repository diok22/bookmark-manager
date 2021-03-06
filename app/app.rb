ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  use Rack::MethodOverride

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do # save a new link
    erb :'link_new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags' do # filter via tags
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do # sign up a new user
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      @status = 'match'
      redirect '/links'
    else
      flash.now[:notice] = 'Password and confirmation password do not match or Email address is already registered'
      erb :'/users/new'
    end
  end

  get '/sessions/new' do  #sign in
    erb :'sessions/new'
  end

  post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
    if user # user will be signed in with correct credentials
      session[:user_id] = user.id
      redirect to('/links')
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do #sign out
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
