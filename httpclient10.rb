# httpclient3.rb

#inf=ARGV[0]
#inf=ARGV[1]
require "socket"

host=ARGV[0]
#"www.is.kyusan-u.ac.jp"
port=80
path=ARGV[1]
#"/~toshi/index.html"


TCPSocket.open host, port do |sock|
    sock.puts "GET #{path} HTTP/1.0"
    sock.puts ""

    while line=sock.gets
        puts line
    end
end
