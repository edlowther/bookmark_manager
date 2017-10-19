ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
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
    link = Link.create(
      :title      => params[:title],
      :url       => params[:url],
      :created_at => Time.now
    )
    tag = Tag.first(:name => params[:tag]) || Tag.create(:name => params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/:title' do
    @title = params[:title].gsub("_", " ")
    erb :"links/link"
  end

  post '/links/:title/newtag' do
    title = params[:title].gsub("_", " ")
    tag = Tag.first(:name => params[:tag]) || Tag.create(:name => params[:tag])
    link = Link.first(:title => title)
    link.tags << tag
    link.save
    redirect '/links'
  end

  post '/tags' do
    redirect '/tags/' + params[:search_term]
  end

  get '/tags/:name' do
    search_term = params['name']
    tag = Tag.first(name: search_term)
    @links = tag ? tag.links : []
    erb :"links/index"
  end
end

include ConnectToDatabase
connect_to_database
