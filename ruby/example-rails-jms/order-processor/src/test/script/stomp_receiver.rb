require 'rubygems'
require 'stomp'

connection = Stomp::Connection.open('root','','localhost',61613)
connection.subscribe('/queue/orders.input', :ack=>'auto')
puts 'Waiting for messages'
while(true)
	message = connection.receive
	puts "Got message #{message.body}"
end
connection.disconnect