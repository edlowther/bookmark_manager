require 'data_mapper'
require 'dm-postgres-adapter'

module ConnectToDatabase
  def connect_to_database
    DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end
end
