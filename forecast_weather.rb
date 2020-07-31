require "json"
require "open-uri"
require "./key"

API_KEY2 = $api_key
BASE_URL2 = "https://api.openweathermap.org/data/2.5/forecast/"
ZIP_COAD2 = "813-0004"

response = open(BASE_URL2 + "?&zip=#{ZIP_COAD2},JP&units=metric&cnt=19&appid=#{API_KEY2}")
#response = open("https://api.openweathermap.org/data/2.5/forecast?&zip=813-0004,JP&units=metric&cnt=19&appid=33ddc704142ad8d908530ba6170281bd")
data = JSON.parse(response.read, {symbolize_names: true})
$fw6 = data[:list][6][:weather][0][:main]
$ft6max = data[:list][6][:main][:temp_max]
$ft6min = data[:list][6][:main][:temp_min]
$fw12 = data[:list][10][:weather][0][:main]
$ft12max = data[:list][10][:main][:temp_max]
$ft12min = data[:list][10][:main][:temp_min]
$fw24 = data[:list][18][:weather][0][:main]
$ft24max = data[:list][18][:main][:temp_max]
$ft24min = data[:list][18][:main][:temp_min]

if $ft6max < 10
    $t6temp="極寒"
elsif $ft6max >= 10 && $ft6max < 17
    $t6temp="寒い"
elsif $ft6max >= 17 && $ft6max < 20
    $t6temp="少し肌寒い"
elsif $ft6max >= 20 && $ft6max < 25
    $t6temp="快適"
elsif $ft6max >= 25 && $ft6max < 27
    $t6temp="少し暑い"
elsif $ft6max>=27
    $t6temp="暑い"
else
    $t6temp="Error"
end

t61 = "今日の松香台の天気は、"
t62 = "最高気温は#{$ft6max}度、最低気温は#{$ft6min}度で#{$t6temp}でしょう。"

if ($fw6 == "Clear") && ($fw12 == "Clear")
    $fw = "#{t61}一日を通して\"晴れる\"でしょう。#{t62}"
elsif ($fw6 == "Clouds") && ($fw12 == "Clouds")
    $fw = "#{t61}一日を通して\"くもり\"でしょう。#{t62}"
elsif ($fw6 == "Rain") && ($fw12 == "Rain")
    $fw = "#{t61}一日を通して\"雨\"が降るでしょう。#{t62}"
elsif ($fw6 == "Snow") && ($fw12 == "Snow")
    $fw = "#{t61}一日を通して\"雪\"が降るでしょう。#{t62}"
elsif ($fw6 == "Thunderstorm") && ($fw12 == "Thunderstorm")
    $fw = "#{t61}一日を通して\"雷雨\"でしょう。#{t62}"
elsif ($fw6 == "Drizzle") && ($fw12 == "Drizzle")
    $fw = "#{t61}一日を通して\"霧雨\"でしょう。#{t62}"
else 
    $fw = "#{t61}\"#{$fw6}\"のち\"#{$fw12}\"でしょう。#{t62}".gsub(/Clear|Clouds|Rain|Snow|Thunderstorm|Drizzle/, "Clear" => "晴れ", "Clouds" => "くもり", "Rain" => "雨", "Snow" => "雪", "Thunderstorm" => "雷雨", "Drizzle" => "霧雨")
end


if $ft24max < 10
    $t24temp="極寒"
elsif $ft24max >= 10 && $ft24max < 17
    $t24temp="寒い"
elsif $ft24max >= 17 && $ft24max < 20
    $t24temp="少し肌寒い"
elsif $ft24max >= 20 && $ft24max < 25
    $t24temp="快適"
elsif $ft24max >= 25 && $ft24max < 27
    $t24temp="少し暑い"
elsif $ft24max>=27
    $t24temp="暑い"
else
    $t24temp="Error"
end

#明日の松香台の天気はくもりでしょう。最高気温、最低気温で暑いでしょう。
t241 = "明日の松香台の天気は、"
t242 = "最高気温#{$ft24max}度、最低気温は#{$ft24min}度で#{$t24temp}でしょう。"

$fw2 = "#{t241}\"#{$fw24}\"でしょう。#{t242}".gsub(/Clear|Clouds|Rain|Snow|Thunderstorm|Drizzle/, "Clear" => "晴れ", "Clouds" => "くもり", "Rain" => "雨", "Snow" => "雪", "Thunderstorm" => "雷雨", "Drizzle" => "霧雨")

#puts $fw2