require 'bunny'

conn = Bunny.new
conn.start

ch = conn.create_channel
q = ch.queue('hello')

puts " [*] Waiting for messages in #{q.name}. To exit press CTRL+C"
q.subscribe(block: true) do |delivery_info, properties, body|
  puts " [x] Received #{body}"
  p delivery_info.inspect
  p properties.inspect

  # cancel the consumer to exit
  p 'before cancel'
  delivery_info.consumer.cancel
  p 'after cancel'
end

puts "  [*] Finish the example!"
conn.close
