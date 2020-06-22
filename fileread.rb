f = open"readwrite.rb", "r"

#"r" read only
#line f.get 1行読み込んでくる
#null=False 最後まで行くとnullを返す
#while から抜け出す

while line = f.gets
    puts line
end

f.close