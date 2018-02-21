require_relative './worker'
require_relative './command'

standard_command = Command.new
worker = Worker.new(standard_command)
worker.listen
