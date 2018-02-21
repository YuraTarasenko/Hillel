require 'json'
require 'socket'

class Worker
  def initialize(command_storage)
    @command_storage = command_storage
  end

  def listen
    loop do
      get_tasks
      execute_tasks
    end
  end

  private

  def get_tasks
    s = TCPSocket.new 'localhost', 2000

    while line = s.gets # read lines from socket
      @tasks = JSON.parse(line)
    end
    s.close
  end

  def execute_tasks
    if @tasks.empty?
      p 'No new tasks!'
      p 'sleep for 3 seconds'
      sleep(3)
    end

    @tasks.each do |task|
      @command_storage.execute_command(task)
    end
    # p '---'
  end
end
