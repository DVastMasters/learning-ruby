# hash literal
# operator => is named hash rocket
# the Hash class employ the Ruby's Enumerable module, so the 
# Array methods in the lesson 6 too work here.
# Doc: https://ruby-doc.org/3.1.2/Hash.html
# Set (mixup between Hash and Array): https://ruby-doc.org/3.1.2/stdlibs/set/Set.html

my_hash = {
  "random world" => "ahoy",
  "math teste score" => 94,
  "an array" => [1, 2, 3],
  "an empty hash within a hash" => {}
}

my_hash = Hash.new
p my_hash #=> {}

hash = { 9 => "nine", :six => 6}

shoes = {
  "summer" => "sandals",
  "winter" => "boots"
}

p shoes["summer"] #=> "sandals"
p shoes["hiking"] #=> nil

# p shoes.fetch("hiking") #=> KeyError: key not found: "hiking"

p shoes.fetch("hiking", "ooops") #=> "ooops"

shoes["fall"] = "sneakers"

p shoes #=> {"summer"=>"sandals", "winter"=>"boots", "fall"=>"sneakers"}

shoes["summer"] = "flip-flops"

p shoes #=> {"summer"=>"flip-flops", "winter"=>"boots", "fall"=>"sneakers"}

p shoes.delete("summer")  #=> "flip-flops"
p shoes #=> {"winter"=>"boots", "fall"=>"sneakers"}

books = {
  "Infinite Jest" => "David Foster Wallace",
  "Into the Wild" => "Jon Krakauer"
}

p books.keys #=> ["Infinite Jest", "Into the Wild"] 
p books.values #=> ["David Foster Wallace", "Jon Krakauer"]

hash1 = { "a" => 100, "b" => 200 }
hash2 = { "b" => 254, "c" => 300 }
p hash1.merge(hash2) #=> {"a"=>100, "b"=>254, "c"=>300}
p hash2.merge(hash1) #=> {"b"=>200, "c"=>300, "a"=>100}


# Is recommended use symbols to key in hashes
# because they are more perfomant than strings

# 'Rocket' syntax
american_cars = {
  :chevrolet => "Corvette",
  :ford => "Mustang",
  :dodge => "Ram"
}

# 'Symbols' syntax
japanese_cars = {
  honda: "Accord",
  toyota: "Corolla",
  nissan: "Altima"
}

p american_cars[:ford] #=> "Mustang"
p japanese_cars[:honda] #=> "Accord"




# launch school
person = {
  name: 'bob',
  height: '6 ft',
  weight: '160 lbs',
  hair: 'brown'
}

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end

def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}" +
         " years old and I live in #{options[:city]}."
  end
end

greeting("Bob")
greeting("Bob", {age: 62, city: "New York City"})
# If the hash is the last parameter, the curly braces arent required
greeting("Bob", age: 62, city: "New York City")


name_and_age = {
  "Bob" => 42,
  "Steve" => 31,
  "Joe" => 19
}

p name_and_age.key?("Steve")

p name_and_age.key?("Larry")

p name_and_age.select { |k, v| k == "Bob" } #=> "Bob"=>42}

p name_and_age.to_a #=> ["Bob", 42], ["Steve", 31], ["Joe", 19]]

# In the ruby's 1.9 and higher versions, the hashs maintain the order in
# witch they're stored. In the older versions, the order can change in every call


# Exercises

# 1 - Given a hash of family members, with keys as the title and an 
#     array of names as the values, use Ruby's built-in select method
#     to gather only siblings' names into a new array.

family = {  
  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}
siblings = family.select { |k, v| k == :brothers || k == :sisters}

p siblings.values.flatten

# 2 - Look at Ruby's merge method. Notice that it has two versions. 
#     What is the difference between merge and merge!? Write a 
#     program that uses both and illustrate the differences.
# merge inst destructive
# merge! is

a = {
  one: 1,
  two: 2,
  three: 3
}

b = {
  four: 4,
  five: 5,
  six: 6
}

p a.merge(b) #=> {:one=>1, :two=>2, :three=>3, :four=>4, :five=>5, :six=>6}
p a #=> {:one=>1, :two=>2, :three=>3}

p a.merge!(b) #=> {:one=>1, :two=>2, :three=>3, :four=>4, :five=>5, :six=>6}
p a #=> {:one=>1, :two=>2, :three=>3, :four=>4, :five=>5, :six=>6}


# 3 - Using some of Ruby's built-in Hash methods, write a program that 
#     loops through a hash and prints all of the keys. Then write a 
#     program that does the same thing except printing the values. 
#     Finally, write a program that prints both.
family = {  
  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

family.each_key { |k| puts "key: #{k}" }
family.each_value { |v| puts "value: #{v}" }
family.each { |k, v| puts "#{k}. #{v}" }


# 4 - Given the following expression, how would you access the name of the person?
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
p person[:name]


# 5 - What method could you use to find out if a Hash contains a specific value in
#     it? Write a program that verifies that the value is within the hash.
a = {
  one: 1,
  two: 2,
  three: 3
}

p a.value?(2)


# 6 - Given the following code...
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

# What's the difference between the two hashes that were created?
# The key from the first hash is a symbol
# The key from the second hash is an string


# 7 - If you see this error, what do you suspect is the most likely problem?
# NoMethodError: undefined method `keys' for Array
# A. We're missing keys in an array variable.

# B. There is no method called keys for Array objects. THIS

# C. keys is an Array object, but it hasn't been defined yet.

# D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.