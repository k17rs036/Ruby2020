require "json"
require "open-uri"
require "./key"

API_KEY = $api_key
BASE_URL = "https://api.openweathermap.org/data/2.5/weather/"
ZIP_COAD = "813-0004"

response = open(BASE_URL + "?&zip=#{ZIP_COAD},JP&units=metric&appid=#{API_KEY}")
data = JSON.parse(response.read, {symbolize_names: true})
$cw = data[:weather][0][:main]
$ct = data[:main][:temp]
$ctmax = data[:main][:temp_max]
$ctmin = data[:main][:temp_min]

if $ctmax < 10
    $cttemp="極寒"
elsif $ctmax >= 10 && $ctmax < 17
    $cttemp="寒い"
elsif $ctmax >= 17 && $ctmax < 20
    $cttemp="少し肌寒い"
elsif $ctmax >= 20 && $ctmax < 25
    $cttemp="快適"
elsif $ctmax >= 25 && $ctmax < 27
    $cttemp="少し暑い"
elsif $ctmax>=27
    $cttemp="暑い"
else
    $cttemp="Error"
end

#puts $cttemp