# 階乗1からxまで掛け算
def fact x
    answer=1
    i=1
    while i<=x
        answer *=i
        i+=1
    end
    answer
end

def fact2 x
    answer=1
    x.times do |i|
        answer *=(i+1)
    end
    answer
end

def factR2 n
    return 1 if n==0
    return n*factR2(n-1) if n>0
end

#再帰呼び出し
def factR n
    if n==0
        1
    else
         n*factR(n-1)
    end
end

x=ARGV[0].to_i
puts fact x
puts fact2 x
puts factR x
puts factR2 x

