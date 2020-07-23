#report_httpclient.rb

#inf=ARGV[0]
#inf=ARGV[1]
require "socket"

##host=ARGV[0]
#"www.is.kyusan-u.ac.jp"
port=80
host="localhost"
path="/"+ARGV[0]
#path="/fn"
#"/~toshi/index.html"

TCPSocket.open host, port do |sock|
    sock.puts "GET #{path} HTTP/1.1"
    sock.puts "HOST: #{host}"
    sock.puts "Connection: close"
    sock.puts ""

    while line=sock.gets
        puts line
    end
end
