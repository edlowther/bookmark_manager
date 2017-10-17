require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/connect_to_database'

class BookmarkManager  < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :"links/index"
  end
end

include ConnectToDatabase
connect_to_database
