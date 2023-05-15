# https://ruby-doc.org/3.1.2/Array.html

# Array literals
num_array = [1, 2, 3, 4, 5]
str_array = ["This", "is", "a", "small", "array"]



Array.new           # []
Array.new(3)        # [nil, nil, nil]
Array.new(3, 7)     # [7, 7, 7]
Array.new(3, true)  # [true, true , true]
a = Array.new(4) {|i| i.to_s }
p a # ["0", "1", "2", "3"]

bidimensional_array = Array.new(3) {Array.new(3)}

puts num_array[5] # nil

p str_array.first # first element
p str_array.first(3) # first three elements


## adding and removing elements
p num_array.push(6, 7) # add to end and return the array

p num_array << 8 # add to end and return the array

p num_array.pop # remove and return the last 

p num_array

p num_array.unshift(0) # add to start and return the array

p num_array.shift # remove and return the first

p num_array.pop(3) # can take arguments

p num_array.shift(2)

p num_array


# concatening arrays

a = [1, 2, 3]
b = [3, 4, 5]

p(a + b)
p(a.concat(b))

# subtracting arrays

c = [1, 1, 1, 2, 2, 3, 4]
d = [1, 4]

p(c - d) # [2, 2, 3]

puts '--- ARRAY METHODS ---'
puts num_array.methods

p [].empty? #=> true

p [[]].empty? #=> false

p [1, 2].empty? #=> false
 
p [1, 2, 3].length #=> 3
 
p [1, 2, 3].count #=> 3
 
p [1, 2, 3].size #=> 3

p [1, 2, 3].reverse #=> [3, 2, 1]

p [1, 2, 3].include?(3) #=> true

p [1, 2, 3].include?("3") #=> false

p [1, 2, 3].join #=> "123"

p [1, 2, 3].join("-") #=> "1-2-3"

p [1, 2, 3].at(0) #=> 1
 
p [1, 2, 3, 4].slice(1, 2) #=> [2, 3]

# p [1, 2, 3].fetch(4) # IndexError: index 4 outside of array bounds: -3...3

p [1, 2, 3].fetch(4, "oops") #=> oops

a = [1, 2, 3, 4]

p a.take(3) #=> [1, 2, 3]

p a #=> [1, 2, 3, 4]

p a.drop(3) #=> [4]

p a #=>  [1, 2, 3, 4]

p [1, 2, 3].insert(4, 'apple') #=> [1, 2, 3, nil, "apple"]

p [1, 2, 3].insert(3, 'apple', 'pear') #=> [1, 2, 3, "apple", "pear"]

p a.delete_at(2) #=> 3

p a #=> [1, 2, 4]

a = [1, 2, 2, 3]

a.delete(2)

p a #=> [1, 3]

a = ['foo', 0, nil, 'bar', 7, 'baz', nil]
p a.compact #=> ["foo", 0, "bar", 7, "baz"]
p a #=> 'foo', 0, nil, 'bar', 7, 'baz', nil]

a.compact!
p a #=> ["foo", 0, "bar", 7, "baz"]

a = [2, 5, 6, 556, 6, 6, 9, 0, 123, 556]
a.uniq!
p a #=> 2, 5, 6, 556, 9, 0, 123]

a = [1, 2]

p a.clear #=> [] destructive

a = [1, 2, 3, 4, 5]

p a.shuffle  #=> [3, 1, 4, 5, 2] Not destructive




puts "launch school-------"

a = [1, 2, 3, 4]
a.map! { |num| num**2} # method #collect make same thing
p a #=> [1, 4, 9, 16]

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p numbers.select { |number| number > 4 } # [5, 6, 7, 8, 9, 10]

puts [1, 2, 3] == [1, 2, 3] #=> true

p [1, 2, 3].to_s # ![1, 2, 3]"


bidimensional_array = Array.new(3) {Array.new(3)}

p bidimensional_array

p bidimensional_array.flatten # convert the nested array in a one-dimensional array

p bidimensional_array # not destructive

a = [1, 2, 3, 4, 5]
a.each_with_index { |val, idx| puts "#{idx+1}. #{val}"}

a = [5, 3, 8, 2, 4, 1]

a.sort!

p a #=> [1, 2, 3, 4, 5, 8]

p a.product([4, 5]) #=> [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5], [4, 4], [4, 5], [5, 4], [5, 5], [8, 4], [8, 5]]



## launchschool exercises

# 1 - Below we have given you an array and a number. 
#     Write a program that checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

p arr.include?(3)


# 2 - What will the following programs return? What is the value of arr after each?

# 1. 
arr = ["b", "a"]
arr = arr.product(Array(1..3)) #=> [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
arr.first.delete(arr.first.last) # => [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

# 2. 
arr = ["b", "a"]
arr = arr.product([Array(1..3)]) #=> [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
arr.first.delete(arr.first.last) #=> [["b"], ["a", [1, 2, 3]]]


# 3 - How do you return the word "example" from the following array?
arr = [["test", "hello", "world"],["example", "mem"]]
p arr[1][0]
p arr.flatten[3]
p arr.last.first


# 4 - What does each method return in the following example?
arr = [15, 7, 18, 5, 12, 8, 5, 1]

# 1.
p arr.index(5) #=> 3

# 2.
# arr.index[5] #=> undefined method `[]' for #<Enumerator:

# 3.
p arr[5] #=> 8


# 5 - What is the value of a, b, and c in the following program?
string = "Welcome to America!"
a = string[6] #=> e
b = string[11] #=> A
c = string[19] #=> nil

p a
p b 
p c


# 6 - You run the following code...
names = ['bob', 'joe', 'susan', 'margaret']
#names['margaret'] = 'jody'

# ...and get the following error message:
=begin
TypeError: no implicit conversion of String into Integer
  from (irb):2:in `[]='
  from (irb):2
  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'
=end

# What is the problem and how can it be fixed?
# To access a element in an array, i need to pass a index, not a value
# to solve:
names[names.index('margaret')] = 'jody'
p names


# 7 - Use the each_with_index method to iterate through an array of 
#     your creation that prints each index and value of the array.

a = ['Maria', 'João', 'Rafael']

a.each_with_index { |val, idx| puts "#{idx} - #{val}" }


# 8 - Write a program that iterates over an array and builds a new 
#     array that is the result of incrementing each value in the 
#     original array by a value of 2. You should have two arrays 
#     at the end of this program, The original array and the new 
#     array you've created. Print both arrays to the screen using 
#     the p method instead of puts.

a = [1, 2, 3]

b = a.map {|val| val + 2}

p a 

p b







puts "\nRuby guides ----- "
## Ruby guides

users = %w(john david peter)
p users

p users.map(&:capitalize)

# pick a random element
p users.sample

a = [1, 2, 3]
b = [4, 2, 6]

# Intersection
p a & b #=> [2]



puts "\nEndPointDev -----"
# UNION
p [1, 2, 1, 2, 3] | [1, 2, 3, 4] #=> [1, 2, 3, 4]

# DIFFERENCE
p [1, 2, 3] - [3, 4, 5] #=> [1, 2]
p [3, 4, 5] - [1, 2, 3] #=> [4, 5]
