def sayhi
    puts "Hello User"
end

sayhi

def sayhi(name="no name", age=-1)
    puts ("Hello " + name + ", you are " + age.to_s)
end

sayhi("Rafael", 21)
sayhi

puts "METHODS WITH RETURN STATEMENT"

def cube(num)
    num * num * num
end

puts cube(3)

def cube(num)
    num * num * num
    5
end

puts cube(3)

def cube(num)
    return num * num * num
    5
end

puts cube(3)

def cube(num)
    return num * num * num, 70
end

puts cube(3)[1]