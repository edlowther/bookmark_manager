require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative '../app/models/link'
require_relative '../app/models/tag'
require_relative '../app/models/person'
DataMapper.setup(:default,  ENV['DATABASE_URL'])
Link.destroy
Tag.destroy
Person.destroy
