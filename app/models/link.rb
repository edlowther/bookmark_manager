require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :url,        Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end

DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
DataMapper.finalize
DataMapper.auto_upgrade!
