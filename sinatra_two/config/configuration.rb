require 'sqlite3'
require 'active_record'

require 'sinatra/base'
require 'slim'

require_relative '../models/product'

require_relative '../controllers/main'
require_relative '../controllers/static'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)
