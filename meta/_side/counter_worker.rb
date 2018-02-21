require 'sidekiq'

class CounterWorker
  include Sidekiq::Worker

  def perform(number)
    (1..number).each do |count|
      puts "Will count up to #{count}"
      sleep(0.1)
    end

    puts "That's all!"
  end
end
