#status = Hash.new
#ハッシュ 連想配列
#添字は何でも良い
#添字をハッシュ関数を使っている？
#ハッシュの場合、添字のことをキーと呼ぶ
#status[key]=value

status={}
status["name"]="aoi"
status["hp"]=10
status["mp"]=5
status["job"]="magician"

puts "name:"+status["name"]
puts "hp:"+status["hp"].to_s

st = {
    "name"=>"aoi",
    "hp"=>10,
    "mp"=>5,
    "job"=>"magician"
}
puts "name:"+st["name"]
puts "hp:"+st["hp"].to_s

#keyで毎回文字列の「””」を使うことが面倒になった。
#シンボル
st = {
    :name=>"aoi",
    :hp=>10,
    :mp=>5,
    :job=>"magician"
}
puts "name:"+st[:name]
puts "hp:"+st[:hp].to_s

#更に簡略化
#初期化のときにしか使えない
st = {
    name:"aoi",
    hp:10,
    mp:5,
    job:"magician"
}
puts "name:"+st[:name]
puts "hp:"+st[:hp].to_s

st.each do |k,v|
    puts k.to_s+":"+v.to_s
end
