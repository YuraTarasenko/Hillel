require_relative './dispatcher'
require_relative './task_storage'
require_relative './db_storage'

require_relative '../config/config'

# server = Dispatcher.new(TaskStorage.new)
db_storage = DBStorage.new(Task)

server = Dispatcher.new(db_storage)
server.dispatch
