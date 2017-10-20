require 'data_mapper'
class Person
  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :name,       String    # A varchar type string, for short strings
  property :email,      String

  has n, :links
end
