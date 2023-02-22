require 'socket'
class Bot
  def listen
    port_to_listen_to = 4000
    puts "starting to listen to: #{port_to_listen_to}"
    server = TCPServer.open(port_to_listen_to)

    loop do
      client = server.accept
    
      puts 'receiving data ' + Time.now.ctime
      puts '--------------------------------------------------------------------------------'
      
      while (a = client.gets) != "\r\n" do
        puts a
      end
    
      puts '--------------------------------------------------------------------------------'
    
    
      client.puts "HTTP/1.1 200 Success"
      client.puts ""
      client.puts "Success\n"
      client.close
    end
  end

  def send_notify(data, service: NotifySender)
    service.send_notify(data)
  end
end