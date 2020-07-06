# httpclient.rb

# http://wwww.is.kyusan-u.ac.jp/~toshi/index.html
# http://wwww.is.kyusan-u.ac.jp/~toshi/test.html


# URL
# <scheme>://<hostname>/<path>
# scheme: http
# hostname: www.is.kyusan-u.ac.jp
# path /~toshi/index.html

# 制御構文 処理の流れを変える
# 例 if while break 

# メソッド 関数
# 例 puts get

# 非表示ライブラリを読み込む
require "socket"

# 変数宣言
host="www.is.kyusan-u.ac.jp"
port=80
path="/~toshi/index.html"

sock=TCPSocket.open host, port
sock.puts "GET #{path}"

while line=sock.gets
    puts line
end

sock.close
