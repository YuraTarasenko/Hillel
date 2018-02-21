require_relative './weather_forecast'
require 'date'

class Command
  DEFAULT_COMMANDS = {
    'time' => -> (params) { p Time.now },
    'stop' => -> (params) { p 'execute stop'; exit },
    'date' => -> (params) { p Date.today },
    'weather' => -> (params) { p WeatherForecast.new.forecast(params['city_name']) },
    'location' => -> (params) { p 'location is fine' },
    'sleep' => -> (params) { p "sleeping for #{params['time']}"; sleep(params['time']) }
  }

  def initialize
    @commands = {}
    insert_default
  end

  def execute_command(task)
    key, params = task['name'], task['params']

    begin
      @commands.fetch(key).call(params)
    rescue KeyError => e
      p "unknown command: #{e.message}"
    end
  end

  def add_command(key, command_block)
    @commands[key] = command_block
  end

  def remove_command(key)
    @commands.delete(key)
  end

  private

  def insert_default
    @commands.merge!(DEFAULT_COMMANDS)
  end
end
