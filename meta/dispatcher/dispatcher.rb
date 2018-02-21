require 'json'
require 'socket'

class Dispatcher
  def initialize(task_storage)
    @task_storage = task_storage
    @server = TCPServer.new(2000)
  end

  def dispatch
    loop do
      Thread.start(@server.accept) do |client|
        tasks_to_send = @task_storage.sample(3)

        client.puts tasks_to_send.to_json
        client.close
      end
    end
  end
end
