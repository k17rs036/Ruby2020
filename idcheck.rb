# 引数(ARGV[0])が20GJK59だったら、toshiと表示。

id=ARGV[0]

if id=="20GJK59"
    puts "toshi"
end

# 引数が??GJK??だったらGJKと表示

# ch =id.split ""
# if ch[2]=="G" && ch[3]=="J" && ch[4]=="K"
#     puts "G"
# end

if /..GJK../ =~ id
    puts "GJK"
end

if /.0GJK../ =~ id
    puts "0GJK"
end

# ^は先頭 $は後ろ
if /^..GJK..$/ =~ id
    puts "^0GJK$"
end

# 何年生か
if /^(..)GJK(..)$/ =~ id
    year = $1
    num = $2
    puts year + "入学GJK"
end

# \d\d数字だけ
if /^(\d\d)GJK(..)$/ =~ id
    year = $1
    num = $2
    puts year + "入学GJK"
end