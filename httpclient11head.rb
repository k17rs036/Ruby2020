# httpclient3.rb
# GET命令を使ってヘッダ状態だけを表示

#inf=ARGV[0]
#inf=ARGV[1]
require "socket"

host=ARGV[0]
#"www.is.kyusan-u.ac.jp"
port=80
path=ARGV[1]
#"/~toshi/index.html"


TCPSocket.open host, port do |sock|
    sock.puts "GET #{path} HTTP/1.1"
    sock.puts "HOST: #{host}"
    sock.puts "Connection: close"
    sock.puts ""

    while line=sock.gets
        #改行コードを削る
        #line=line.chomp
        line.chomp!
        #p line
        #"/r/n" 改行コード
        if line == ""
            break
        end
        puts line
    end
end
