# キーボードから数字を入力
# 入力された回数を "Ruby"という行を
# rubyout.txtというファイルに出力

=begin 
# 例
# 5が入力されたら
Ruby
Ruby
Ruby
Ruby
Ruby
=end

n=gets.to_i
open "rubyout.txt" , "w" do |f|
    n.times do |i|
        f.puts "Ruby"
    end
end

#open "filecreator" , "r" do |f|
#    while 
#puts ruby 