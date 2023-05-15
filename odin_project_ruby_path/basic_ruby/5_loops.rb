i = 0
# infinite loop
loop do 
  puts "i is #{i}"
  i += 1
  break if i == 20
end

# while loop
i = 0
while i < 10 do
  puts "i is #{i}"
  i += 1
end

# until loop
i = 0
until i >= 10 do
  puts "i is #{i}"
  i += 1
end

# Ranges
(1..5)   # inclusive range: 1, 2, 3, 4, 5 
(1...5)  # exclusive range: 1, 2, 3, 4

('a'..'d') # a, b, c, d

# for
for i in 0..5
  puts "#{i} zombies incoming!"
end


# times loop
5.times do
  puts "Hello, world!"
end

# 0 - 4
5.times do |number|
  puts "Alternative fact number #{number}"
end

5.upto(10) {|num| print "#{num} " }
10.downto(5) {|num| print "#{num} "}

10.downto(5) do |num|
 print "#{num} "
end





i = 0
loop do # make a new scope
  i += 2
  if i == 4
    next
  end
  puts i
  if i == 10
    break
  end
end





names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
names.each { |name| puts name }

x = 1
names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end

puts '------ EACH INDEX -----'
names.each_index { |i| puts i }



### recursion
def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end


puts '-------'
puts doubler(2)



# fibonacci
def fibonacci(number)
  if number < 2
    return number
  end
  return fibonacci(number-1) + fibonacci(number-2)  
end

puts fibonacci(3)

# 1, 1, 2, 3, 5, 8, 13, 21


# break = stop the current loop
# next = jump to the next iteration
# redo = restart the loop
# retry = restart the loop and re-evaluate the condition before running (now work with while or until)











# launch school exercises

# 1 - What does the each method in the following program return after 
#     it is finished executing?
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end

# [1, 2, 3, 4, 5] in IRB

# 2 - Write a while loop that takes input from the user, performs an 
#     action, and only stops when the user types "STOP". Each loop 
#     can get info from the user.
=begin
puts "Input something:"
until gets.chomp == "STOP" do
  puts "Great! Input something more:"
end
=end


# 3 - Write a method that counts down to zero using recursion.
def count_to_zero(upper_number)
  if upper_number <= 0 then
    puts upper_number
  else
    puts upper_number
    count_to_zero(upper_number - 1)
  end 
end

count_to_zero(1)