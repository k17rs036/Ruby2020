# report_httpserver.rb

require 'socket'
require 'date'
require "json"
require "open-uri"
require "./key"

API_KEY = $api_key
BASE_URL = "https://api.openweathermap.org/data/2.5/weather/"
ZIP_COAD = "813-0004"

def server sock
    response = open(BASE_URL + "?&zip=#{ZIP_COAD},JP&units=metric&appid=#{API_KEY}")
    data = JSON.parse(response.read, {symbolize_names: true})
    weather = data[:weather][0][:main]
    t1 = "現在の福岡市の天気は"
    t2 = "です。"
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
                "\n\"hello\""+"    "+"Return HELLO!"+
                "\n\"now\""+"      "+"Answer the Current time"+
                "\n\"cw\""+"       "+"Answer the Current weather in Fukuoka"+
                "\n\"tdw\""+"      "+"Answer the Today's weather in Fukuoka"+ 
                "\n\"tmw\""+"      "+"Answer the Tomorrow's weather in Fukuoka"
            elsif path=="/hello"
                body += "HELLO!"
            elsif path=="/now"
                body += DateTime.now.to_s
            elsif path=="/cw"
                if weather == "Clear"
                    body += t1+"\"晴れ\""+t2
                elsif weather == "Clouds"
                    body += t1+"\"くもり\""+t2
                elsif weather == "Rain"
                    body += t1+"\"雨\""+t2
                elsif weather == "Snow"
                    body += t1+"\"雪\""+t2
                else
                    body weather
                end
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