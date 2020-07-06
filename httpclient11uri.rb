# httpclient3.rb
# GET命令を使ってヘッダ状態だけを表示

#inf=ARGV[0]
#inf=ARGV[1]
require "socket"

proto,dummy,host,*arg=ARGV[0].split "/"
path=arg.join "/"

port=80

TCPSocket.open host, port do |sock|
    sock.puts "GET /#{path} HTTP/1.1"
    sock.puts "HOST: #{host}"
    sock.puts "Connection: close"
    sock.puts ""

    is_body=false
    while line=sock.gets
        puts line
    end
end
