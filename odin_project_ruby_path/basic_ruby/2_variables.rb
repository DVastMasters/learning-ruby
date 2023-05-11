# variables in ruby doesn't contain the data, 
# it contains the address of that data.

# variables are pointers to physical space in memory

# Always who a variable is declared, is necessary to assing a value
my_variable = nil

age = 18

age << 18

# Ruby evaluates the expression on the right first. 
age = 18 + 5

age = 18

age += 5

age -+ 5

age *= 2

age /= 10

puts "\n-------------"
desired_location = "Barcelona"
johns_location = desired_location 
# Now, johns_location variables is poiting to the 
# same memory addres who desired_location

puts desired_location
puts johns_location

puts "\n-------------"
desired_location = 'Paris'

puts desired_location
puts johns_location

puts "\n-------------"
desired_location = "Barcelona"
johns_location = desired_location

# A method, typically, dont change a object, but make a copy of this.
# However some native ruby methods has a ! symbol, this methods change
# the object in memory, dont copy. 
desired_location.upcase! 

puts desired_location
puts johns_location

tom = "kitty"
jerry = tom

# Make a NEW OBJECT
tom += "kat"

# puts tom   # kitty
# puts jerry # kittykat

tom = "kitty"
jerry = tom

# Change the original object
tom << "kat"

# puts tom   # kittykat
# puts jerry # kittykatsu


puts "\n-------------"
name = 'Somebody Else'

def print_full_name(first_name, last_name)
  puts name 
end

# NameError: undefined local variable or method `name' for main
# print_full_name 'Rafael', 'Dutra' 

def print_full_name(first_name, last_name)
  name = first_name + ' ' + last_name
  puts name
end

print_full_name 'Rafael', 'Dutra' 
# Rafael Dutra

puts "\n-------------"
total = 0
[1, 2, 3].each { |number| total += number }
puts total #6


puts "\n-------------"
a = 5

3.times do |n| # new scope (because times is a function)
  a = 3
  b = 5 # b is initialized in the inner scope
end

puts a # 5
# puts b # NameError: undefined local variable or method `b' for main


puts "\n-------------"

arr = [1, 2, 3]

for i in arr do # DONT MAKE A NEW SCOPE
  a = 5
end

puts a # 5


puts "\n-------------"
# Constants
MY_CONSTANT = 'I am available throughout your app.'

MY_CONSTANT = 'Changing' 
# Ruby says: warning: already initialized constant MY_CONSTANT

=begin
def creating_constant()
  CONSTANT_IN_METHOD = 'Is not possible'
end
=end
# Ruby says: Error: dynamic constant assignment

puts "\n-------------"
# Global variables # avoid this
$var = 'I am also available throughout your app.' 
puts $var


# Class variables 
# @@instances = 0 # static class variables


# Instance variable
# @var = 'I am available throughout the current instance of this class.'


puts "\n-------------"
# Local variables
var = 'I must be passed around to cross scope boundaries.'
puts var




# launch school exercies

# 1 - Write a program that asks the user to type in their name and 
#     then prints out a greeting message with their name included.

puts "What's your name?"
user_name = gets.chomp()
puts "Hello, #{user_name}!"

# 2 - Write a program that asks a user how old they 
#     are and then tells them how old they will be in 10, 20, 30 
#     and 40 years. Below is the output for someone 20 years old.

puts "How old are you?"
user_age = gets.chomp().to_i
puts "In 10 years you will be: #{user_age + 10}"
puts "In 20 years you will be: #{user_age + 20}"
puts "In 30 years you will be: #{user_age + 30}"
puts "In 40 years you will be: #{user_age + 40}"

# 3 - Add another section onto exercise 1 that prints the name of the 
#     user 10 times. You must do this without explicitly writing the 
#     puts method 10 times in a row. Hint: you can use the times 
#     method to do something repeatedly.

puts "What's your name?"
user_name = gets.chomp
10.times do 
  puts "Hello, #{user_name}"
end

# 4 - Modify exercise 1 again so that it first asks the user for their 
#     first name, saves it into a variable, and then does the same 
#     for the last name. Then outputs their full name all at once.

puts "What's your first name?"
first_name = gets.chomp
puts "What's your last name?"
last_name = gets.chomp

puts "Hello, #{first_name} #{last_name}"