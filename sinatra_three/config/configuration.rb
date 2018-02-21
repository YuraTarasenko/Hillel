require 'sqlite3'
require 'active_record'
require 'gibberish'

require 'sinatra/base'
require 'slim'

require 'logger'

require_relative '../models/product'
require_relative '../models/user'

require_relative '../controllers/main'
require_relative '../controllers/static'
require_relative '../controllers/admin/products'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

def log(message)
  Logger.new(STDOUT).info(message)
end
