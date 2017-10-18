ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/connect_to_database'

class BookmarkManager  < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :"links/index"
  end

  get '/links/new' do
    erb :"links/new"
  end

  post '/links' do
    Link.create(
      :title      => params[:title],
      :url       => params[:url],
      :created_at => Time.now
    )
    redirect '/links'
  end
end

include ConnectToDatabase
connect_to_database
