#! /usr/bin/env ruby
#2つの引数xとyのうち、大きい値を返すメソッドmyMaxを宣言する
#myMaxを呼び出し、2つの値のうち大きいほうの値を表示せよ

def myMax x,y
    if(x>=y)
        x
    else
        y
    end
end

a=ARGV[0].to_i
b=ARGV[1].to_i
c=myMax a,b
puts c
