ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/person'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/connect_to_database'

class BookmarkManager  < Sinatra::Base
  enable :sessions

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    person = Person.create(
      :name => params[:name],
      :email => params[:email]
    )
    session[:current_user_id] = person.id
    redirect '/links'
  end

  get '/users' do
    @users = Person.all
    erb :"users/index"
  end

  get '/links' do
    @links = Link.all || []
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
    person = Person.get(session[:current_user_id])
    person.links << link
    link.person = person
    link.save
    person.save
    redirect '/links'
  end

  get '/links/:title/tags/new' do
    @link = Link.first(:title => params[:title].gsub("_", " "))
    erb :"links/link"
  end

  post '/links/:title/tags' do
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
