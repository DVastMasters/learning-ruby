# Unix-like systems treat all external devices as files.
# stdin -> Standard Input -> fd0
# stdout -> Standard Output -> fd1
# stderr -> Standard Error -> fd2

$stdout.puts 'Hello World'

# $stdin.puts 'foo' # not opened for writing
# $stdout.gets      # not opened for reading

io = IO.new(1) # stdout
io.puts 'Hello World'

fd = IO.sysopen('/dev/null', 'w+')
dev_null = IO.new(fd)
dev_null.puts 'Hello' # nil
dev_null.gets # nil
dev_null.close # nil

fd_code = IO.sysopen 'lorem.txt', 'w+'
lorem = IO.new(fd_code)
print lorem.gets
puts lorem.pos
print lorem.gets
print lorem.gets
puts lorem.pos
puts lorem.gets # nill

puts lorem.eof? # end of file?

lorem.rewind # return to beginning
puts lorem.pos

lorem.puts 'Hello World'
lorem.puts 'goodbye world'

puts lorem.gets # nil
puts lorem.eof?

puts lorem.rewind
puts lorem.gets

puts lorem.pos
lorem.puts "middle"

lorem.rewind
puts lorem.read