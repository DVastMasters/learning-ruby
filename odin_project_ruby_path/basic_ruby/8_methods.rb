# Methods names
# Can use: upper-case and lower-case letters, numbers, underscores _ 
# and the punctation signs !, ?, =. 
# Best practices: 
# 1. Full down-case
# 2. Predicates have a question mark ? (Array#empty?, Hash#has_key?)
# 3. Bangs have an exclamation mark ! (Array#sort!, Array#slice!)
# 4. Setters have an equal sign = (Array#[]=)

# Parameter: function variable placeholder
# Argument: variable passed to function


# implicit return
def my_name
  "Rafael Dutra"
end

puts my_name

# name is parameter, "John" is argument.
def greet(name = "stranger")
  "Hello, " + name + "!"
end

puts greet("John") #=> Hello, John!
puts greet

def even_odd(number)
  unless number.is_a? Numeric
    return "A number was not entered."
  end

  if number.odd?
    "That is an even number."
  else
    "That is an odd number."
  end
end

puts even_odd(16)
puts even_odd(17)
puts even_odd("Ruby")



# launch school exercises

# 1 - Write a program that prints a greeting message. This program 
#     should contain a method called greeting that takes a name as 
#     its parameter and returns a string.
def greetings(name)
  "Hello, #{name}"
end

puts greetings("Rafael")

# 2 - What do the following expressions evaluate to? That is, what 
#     value does each expression return?
  # 1. 
x = 2 # 2

  # 2. 
puts x = 2 # nil

  # 3. 
p name = "Joe" # "Joe"

  # 4. 
four = "four" # "four"

  # 5. 
print something = "nothing" # nil

# 3 - Write a program that includes a method called multiply that 
#     takes two arguments and returns the product of the two numbers.
def multiply(num1, num2)
  num1 * num2
end

puts multiply(2, 2)

# 4 - What will the following code print to the screen?
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee") # it will not print anything

# 5 - 1) Edit the method definition in exercise #4 so that it does 
#     print words on the screen. 2) What does it return now?
def scream(words)
  words = words + "!!!!"  
  puts words
end

scream("Yippeee") # return nil


# 6 - What does the following error message tell you?
=begin
ArgumentError: wrong number of arguments (1 for 2)
  from (irb):1:in `calculate_product'
  from (irb):4
  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'
=end
# The method take two arguments, but only 1 were passed in