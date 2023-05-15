# falsy values in ruby is:
# nil
# false

# Everything else is considered true

if nil 
  puts 'nil is true'
else 
  puts 'nil is false'
end

if false
  puts 'false is true'
else 
  puts 'false is false'
end

if 0
  puts '0 is true'
end

if ''
  puts "'' is true"
end

puts 'Hot diggity damn, 1 is less than 2' if 1 < 2

if 1 == 2
  puts '1 is equal to 2'
elsif 1 == 1
  puts '1 is equal to 1'
end

if 1 == 2
  puts '1 is equal to 2'
else
  puts '1 is not equal to 2'
end


# will return the last value evaluated
my_variable = 3 || 'foo'    # 3 => 3 is truthy to ruby, so isn't necessary evaluate the second value
my_variable = 'foo' || 3    # 'foo' => 'foo' is truthy to ruby, so isn't necessary evaluate the second value
my_variable = nil || 'foo' # 'foo' => nil is falsy to ruby, so is necessary evaluate the second value
my_variable = nil || false # false => nil is falsy to ruby, so is necessary evaluate the second value (who is falsy too, mas is the last value evaluated)

my_variable = nil && 'foo' # nill => nil is falsy to ruby, so isn't necessary evaluate the second value
my_variable = 3 && 'foo'   # 'foo' => the two values are truthy, but the last value evaluated is 'foo'
my_variable = 'foo' && 3   # 3
my_variable = nil && false # nil

foo = nil 
bar = 'qux'
isOk = foo || bar     # 'qux'
isOk = !!(foo || bar) # true => (foo || bar) is truthy, !truthy is false, !false is true

## Comparators [==, !=, >, <, >=, <=]
puts 'eql? ---'
# eql? -> check the type and value
puts 5.eql?(5.0) # false
puts 5.eql?(6) # false
puts 5.eql?(5) # true

puts 'equal? ---'
# equal? -> check whether both values are the 
#           exact same object in memory
a = 5
b = 5
puts a.equal?(b) # true

a = 'String'
b = 'String'
puts a.equal?(b) # false

b = a 
puts a.equal?(b) # true

# spaceship operator <=> Useful to sort algorithms
puts 'spaceship operator ---'
puts 5 <=> 10 # -1 => value on the left is less than the value on the right;
puts 10 <=> 10 # 0 => equal values
puts 10 <=> 5 #  1 => value on the left is greater than the value on the right;

puts 'a' <=> 'b' # -1

puts 'Rafael' <=> 'João' # 1



# logical operators
# Precedence order in ruby:
# <=, <, >, >=
# ==, !=
# &&
# ||

if nil || 42
  puts '42 is true'
end

if 23 && 42
  puts '23 is true'
end

if nil or 42
  puts '42 is true'
end

if 42 and 32
  puts '42 is true'
end

# The difference between the symbolics operators and the english-style
# is the precedence.

user = Struct.new(:name).new("Avdi")
user_name = user && user.name  # user_name = (user && user.name)
puts user_name # Avdi
user_name = user and user.name # (user_name = user) and user.name
puts user_name # #<struct name="Avdi">

puts (:x || :y && nil) # :x || (:y && nil)
puts (:x or :y and nil) # nil => (:x or :y) and nil


## Short circuit evaluation

if 1 < 2 || 5 < 3
  puts 'The second expression will not be calculated, because the first already return true'
end

if 1 < 2 && 5 > 5
  puts 'The second expression will not be calculated, because the first already return false'
end

if !false
  puts '!false is true'
end






grade = 'F'

did_i_pass = case grade
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHAL NOT PASSAS!' -Gandalf"
end

puts did_i_pass

grade = 'D'
case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHAL NOT PASSAS!' -Gandalf"
  fml = true
end






# unless operator
# executes the block when the expression evaluate to false
age = 19
unless age < 18
  puts "Get a job."
end

puts "Get a job." unless age < 18






# ternary operator
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response




# launch school exercises
# 1 - Write down whether the following expressions return true or false. 
#     Then type the expressions into irb to see the results.

(32 * 4) >= 129 # false
false != !true # false
true == 4 # false
false == (847 == '847') # true
(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false # true

# 2 - Write a method that takes a string as an argument. The method 
#     should return a new, all-caps version of the string, only if 
#     the string is longer than 10 characters. Example: change 
#     "hello world" to "HELLO WORLD". (Hint: Ruby's String class has 
#     a few methods that would be helpful. Check the Ruby Docs!)

def upper_case_if_more_than_10_characters(string)
  string.length > 10 ? string.upcase : string
end

puts upper_case_if_more_than_10_characters('hlo world')
puts upper_case_if_more_than_10_characters('hello world')

# 3 - Write a program that takes a number from the user between 0 
#     and 100 and reports back whether the number is between 0 and 
#     50, 51 and 100, or above 100.

def check_range(number)
  if number < 0 
    'Below 0'
  elsif number < 51
    'Between 0 and 50'
  elsif number < 101 
    'Between 51 and 100'
  else 
    'Above 100'
  end
end

puts 'Enter a number between 0 and 100.'
number = gets.chomp.to_i
puts check_range(number)

# 4 - What will each block of code below print to the screen? 
#     Write your answer on a piece of paper or in a text editor 
#     and then run each block of code to see if you were correct.

# Snippet 1
'4' == 4 ? puts("TRUE") : puts("FALSE") # FALSE

# Snippet 2
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?" # this
end

# Snippet 3
y = 9
x = 10
if (x + 1) <= (y) # false
  puts "Alright."
elsif (x + 1) >= (y) # true
  puts "Alright now!"
elsif (y + 1) == x # false
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end

# 5 - When you run the following code...

def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
  end # this line not exists in the exercise text 
end

equal_to_four(5)

# You get the following error message..
# syntax error, unexpected end-of-input, expecting keyword_end

# Why do you get this error and how can you fix it?
# Is missing a 'end' word before the last 'end' word inside the method.


# 6 - Write down whether the following expressions return true or false 
#     or raise an error. Then, type the expressions into irb to see the results. 

# (32 * 4) >= "129" # comparison of Integer with String failed (ArgumentError)
847 == '847'      # false
'847' < '846'     # false
'847' > '846'     # true
'847' > '8478'    # false
'847' < '8478'    # true
