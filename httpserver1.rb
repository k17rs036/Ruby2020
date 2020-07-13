# httpserver1.rb

require 'socket'

s=TCPServer.open 80

sock=s.accept
while line=sock.gets
    line.chomp!
    break if line==""
    p line
    sock.puts "receive: #{line}"
end
sock.close

s.close