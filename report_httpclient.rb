#report_httpclient.rb

require "socket"

port=80
host="localhost"
path="/"+ARGV[0]

TCPSocket.open host, port do |sock|
    sock.puts "GET #{path} HTTP/1.1"
    sock.puts "HOST: #{host}"
    sock.puts "Connection: close"
    sock.puts ""

    while line=sock.gets
        puts line
    end
end
