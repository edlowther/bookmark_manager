require 'data_mapper'
class Link
  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :url,        Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.

  has n, :tags, :through => Resource
end
