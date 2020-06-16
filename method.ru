#! /usr/bin/env ruby
# メソッドを定義 def=define
def sum x,y
    x+y
end

#a=10
#b=5

#argument 引数
#argv argument value

a=ARGV[0].to_i
b=ARGV[1].to_i
x=sum a,b
puts x
