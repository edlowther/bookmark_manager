require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'
DataMapper.setup(:default,  ENV['DATABASE_URL'])
Link.destroy
Tag.destroy
