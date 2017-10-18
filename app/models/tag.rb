require 'data_mapper'
class Tag
  include DataMapper::Resource
  property :id,         Serial     # An auto-increment integer key
  property :name,       String     # A varchar type string, for short strings

  has n, :links, :through => Resource
end
