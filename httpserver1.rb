# httpserver1.rb

require 'socket'
require 'date'

def server sock
    body=""
    while line=sock.gets
        line.chomp!
        break if line==""
        p line
        #body += "receive: #{line}<br>"
        if /^GET (.*) HTTP/ =~ line
            path=$1
            if path=="/hello"
                body += "HELLO!"
            elsif path=="/now"
                body += DateTime.now.to_s
            else
                body += "unknown #{path}"
            end
        end
    end

    sock.puts "HTTP/1.0 200 OK"
    sock.puts ""
    sock.puts "<!DOCTYPE html>"
    sock.puts "<html><body>"
#    sock.puts "<h1>my server</h1>"
    sock.puts body
    sock.puts "</html></body>"
    sock.close
end

TCPServer.open 80 do |s|

#マルチスレッド化
    while true
        Thread.new s.accept do |sock|
            server sock
        end
    end
end

s.close