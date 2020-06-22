inf=ARGV[0]
outf=ARGV[1]

# r read w write a append

fin = open inf, "r"
fout = open outf, "a"

while line = fin.gets
    fout.puts line
end

fout.close
fin.close
