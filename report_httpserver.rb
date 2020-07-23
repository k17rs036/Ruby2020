# httpserver1.rb

require 'socket'
require 'date'

def server sock
    body=""
    #l1=""
    while line=sock.gets
        line.chomp!
        break if line==""
        p line
        #body += "receive: #{line}<br>"
        if /^GET (.*) HTTP/ =~ line
            path=$1
            if path=="/fn"
                body += "-Functions List-"+
                "\n\"now\""+"               "+"Answer the Current time"+
                "\n\"hello\""+"             "+"Return HELLO!"+
                "\n\"current-weather\""+"   "+"Answer the current weather in Fukuoka"+
                "\n\"today-weather\""+"     "+"Answer the today weather in Fukuoka"+ 
                "\n\"tomorrow-weather\""+"  "+"Answer the tomorrow weather in Fukuoka"
            elsif path=="/hello"
                body += "HELLO!"
            elsif path=="/now"
                body += DateTime.now.to_s
            # elsif path==""
            #     body += "Functions
            #     hello"
            else
                body += "unknown #{path}"
            end
        end
    end

#    sock.puts "HTTP/1.0 200 OK"
#    sock.puts ""
#    sock.puts "<!DOCTYPE html>"
#    sock.puts "<html><body>"
#    sock.puts "<h1>my server</h1>"
    sock.puts body
#    sock.puts l1
#    sock.puts "</html></body>"
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