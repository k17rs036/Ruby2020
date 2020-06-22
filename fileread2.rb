#closeを書かなくてもいい
open "readwrite.rb" , "r" do |f|
    while line = f.gets
        puts line
    end
end
