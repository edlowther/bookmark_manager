require 'data_mapper'

class Person
  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :name,       String    # A varchar type string, for short strings
  property :email,      String
  property :password_digest,   Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  has n, :links
end
