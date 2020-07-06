puts ARGV[0]

words=ARGV[0].split '/'
p words
host=words[2]
path='/' + words[3] + '/' + words[4]
p host
p path

proto,dummy,host,*path=ARGV[0].split "/"
p proto
p dummy
p host
p path