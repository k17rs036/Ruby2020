# httpclient11body2.rb
# GET 命令を使ってヘッダ情報だけを表示

require "socket"

host=ARGV[0]
port=80
path=ARGV[1]

TCPSocket.open host, port do |sock|
    sock.puts "GET #{path} HTTP/1.1"
    sock.puts "HOST: #{host}"
    sock.puts "Connection: close"
    sock.puts ""

    while line=sock.gets
        line.chomp!
        if line == ""
            break
        end
    end

    while line=sock.gets
        line.chomp!
        puts line
    end

end