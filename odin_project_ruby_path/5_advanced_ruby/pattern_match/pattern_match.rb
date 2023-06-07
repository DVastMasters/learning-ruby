grade = 'C'

case grade
in 'A' then puts 'Amazing effort'
in 'B' then puts 'Good work'
in 'C' then puts 'Well done'
in 'D' then puts 'Room for improvement'
else puts 'See me'
end


## Object Pattern Match

input = 3

# Integer === 3 (true), dont 3 === Integer (false)
case input
in String then puts 'input was of type String'
in Integer then puts 'input was of type Integer'
end

## Variable Pattern

age = 15

case age
in a
  puts a
end

a = 5
case 1
in a
  a
end

puts a

=begin

a = 5
case 1
in ^a # pin operator
  :no_match
end
# 5 === 1 does not return true (NoMatchingPatternError)

=end



## As Pattern Match

case 3
in 3 => a
  puts a
end



## Alternative Pattern Match

case 0
in 0 | 1 | 2
  puts :match
end


## Guard Conditions

some_other_value = true

case 0
in 0 if some_other_value
  puts :match
end

## Array Pattern Match

arr = [1, 2]

case arr
in [1, 2] then puts :match
in [3, 4] then puts :no_match
end

case arr
in [Integer, Integer]
  puts :match
in [String, String]
  puts :no_match
end

arr = [1, 2, 3]

=begin

case arr
in [Integer, Integer] # (NoMatchingPatternError)
  puts :match
end

=end

case arr
in [Integer, Integer, *]
  puts :match
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

case arr
in [Integer, Integer, *, Integer, Integer]
  puts :match
end

arr = [1, 2, 3, 4]

case arr
in [1, 2, *tail]
  p tail
end

arr = [1, 2, 3, 4]

case arr
in [_, _, 3, 4]
  puts :match
end

arr = [1, 2]

case arr
in [a, b] unless a == b
  puts :match
end

arr = [1, 2, [3, 4]]

case arr
in [_, _, [3, 4]]
  puts :match
end

case [1, 2, 3, [4, 5]]
in [1, 2, 3, [4, a] => arr]
  puts a
  p arr
end

arr = [1, 2, 3]

case [1, 2, 4]
in arr
  :match
end

p arr

arr = [1, 2, 3, 4]
case arr
in 1, 2, 3, 4
  puts :match
end



# Hash Pattern Matching
# only works with symbols

case { a: 'apple', b: 'banana' }
in { a: 'aardvark', b: 'bat' }
  puts :no_match
in { a: 'apple', b: 'banana' }
  puts :match
end

case { a: 'apple', b: 'banana' }
in { a: a, b: b}
  puts a
  puts b 
end

case { a: 'apple', b: 'banana' }
in { a: , b:}
  puts a
  puts b 
end

case { a: 'apple', b: 'banana' }
in a: , b:
  puts a
  puts b 
end

case { a: 'ant', b: 'ball', c: 'cat' }
in { a: 'ant', **rest }
  p rest
end

case { a: 'ant', b: 'ball' }
in { a: 'ant' }
  'this will match'
in { a: 'ant', b: 'ball' }
  'this will never be reached'
end

case { a: 'ant', b: 'ball' }
in { a: 'ant', **nil }
  puts :no_match
in { a: 'ant', b: 'ball' }
  puts :match
end

case { a: 'ant', b: 'ball' }
in { a: 'ant' } => hash
  p hash
end





## Rightward Assignment
login = { username: 'hornby', password: 'iliketrains' }

login => { username: username } 
# username = login[:username]

puts "Logged in with username #{username}"





# Find Pattern
case [1, 2, 3]
in [*pre, 1, 2, 3, *post]
  p pre
  p post
end

case [1, 2, 3, 4, 5]
in [*pre, 2, 3, *post]
  p pre
  p post
end


case [1, 2, "a", 4, "b", "c", 7, 8, 9]
in [*pre, String => x, String => z, *post]
  p pre
  p x
  p z
  p post 
end


=begin
Let’s say you get a name, age, and job title as parameters. 
If that person exists, you need to return their first language, otherwise nil.
=end

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

## Without pattern matching

name = 'Jill'
age = 32
job_title = 'leet coder'

match = data.find do |person|
  person[:name] == name && person[:age] == age && person[:job_title] == job_title
end

# & safe serach navigator. If match is nill, dont raise an error.

match&.fetch(:first_language)


## with pattern matching

name = 'Jill'
age = 32
job_title = 'leet_coder'

case data
in [*, { name: ^name, age: ^age, first_language: first_language, job_title: ^job_title }, *]
else
  first_language = nil
end

puts first_language