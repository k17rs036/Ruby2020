# report_httpserver.rb

require 'socket'
require 'date'
require "json"
require "open-uri"
require "./key"
require "./current_weather"
require "./forecast_weather"

def server sock
    cw = $cw
    ct = $ct
    ctmax = $ctmax
    ctmin = $ctmin
    fw = $fw
    fw2 = $fw2
    cttemp = $cttemp

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
                "\n\"hello\""+"    "+"HELLO!を返す"+
                "\n\"now\""+"      "+"現在日時を返す"+
                "\n\"cw\""+"       "+"現在の松香台の天気を返す"+
                "\n\"tdw\""+"      "+"今日の松香台の天気予報を返す"+ 
                "\n\"tmw\""+"      "+"明日の松香台の天気予報を返す"
            elsif path=="/hello"
                body += "HELLO!"
            elsif path=="/now"
                body += DateTime.now.to_s
                #現在、松香台の気温は XX度で、 晴れ です。今日は 予想最高気温XX度、最低気温XX度で晴れるでしょう！
            elsif path=="/cw"
                if cw == "Clear"
                    body += "現在、松香台は#{$ct}度で\"晴れ\"です。今日の予想最高気温は#{$ctmax}度、最低気温は#{$ctmin}度で#{$cttemp}です。"
                elsif cw == "Clouds"
                    body += "現在、松香台は#{$ct}度で\"くもり\"です。今日の予想最高気温は#{$ctmax}度、最低気温は#{$ctmin}度で#{$cttemp}です。"
                elsif cw == "Rain"
                    body += "現在、松香台は#{$ct}度で\"雨\"です。今日の予想最高気温は#{$ctmax}度、最低気温は#{$ctmin}度で#{$cttemp}です。"
                elsif cw == "Snow"
                    body += "現在、松香台は#{$ct}度で\"雪\"です。今日の予想最高気温は#{$ctmax}度、最低気温は#{$ctmin}度で#{$cttemp}です。"
                elsif cw == "Thunderstorm"
                    body +=  "現在、松香台は#{$ct}度で\"雷雨\"です。今日の予想最高気温は#{$ctmax}度、最低気温は#{$ctmin}度で#{$cttemp}です。"
                elsif cw == "Drizzle"
                    body += "現在、松香台は#{$ct}度で\"霧雨\"です。今日の予想最高気温は#{$ctmax}度、最低気温は#{$ctmin}度で#{$cttemp}です。"
                else
                    body += "Error"
                end
            elsif path=="/cw1"
                body += "現在、松香台は#{$ct}度で\"#{$cw}\"です。今日の予想最高気温は#{$ctmax}度、最低気温は#{$ctmin}度で#{$cttemp}です。".gsub(/Clear|Clouds|Rain|Snow|Thunderstorm|Drizzle/, "Clear" => "晴れ", "Clouds" => "くもり", "Rain" => "雨", "Snow" => "雪", "Thunderstorm" => "雷雨", "Drizzle" => "霧雨")
            elsif path=="/tdw"
                body += "#{$fw}"
            elsif path=="/tmw"
                body += "#{$fw2}"
            else
                body += "unknown #{path} fnと入力して下さい。機能一覧を表示します。"
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