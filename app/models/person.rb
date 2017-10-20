require 'data_mapper'

class Person
  include DataMapper::Resource
  property :id,         Serial    # An auto-increment integer key
  property :name,       String    # A varchar type string, for short strings
  property :email,      String
  property :password_digest,   Text

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :links

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
end
