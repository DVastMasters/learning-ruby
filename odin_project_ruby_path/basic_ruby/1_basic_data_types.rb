# Everything in ruby is an object

######## ODIN

### Numbers

# Adition
1 + 1   #=> 2

# Subtraction
2 - 1   #=> 1

# Multiplication
2 * 2   #=> 4

# Division
10 / 5  #=> 2

# Exponent
2 ** 2  #=> 4
3 ** 4  #=> 81

# Modulus (find the remainder of division)
8 % 2   #=> 0   (8 / 2 = 4; no remainder)
10 % 4  #=> 2   (10 / 4 = 2 with a remainder of 2)

# Remainder method
16.remainder(5) #=> 1

# Divmod
16.divmod(5) #=> [3, 1]

# Modulo and remainder aren't the same thing in ruby
# https://medium.com/@tannrallard/exploring-the-difference-between-modulus-and-remainder-in-rubys-numeric-class-65eb8b50a4b8
17 % 5           #=> 2
17.remainder(5)  #=> 2
17.divmod(5)     #=> [3, 2]

-17 % 5          #=> 3
-17.remainder(5) #=> -2
17.divmod(5)     #=> [-4, 3]

# if you need to determine the modulo or remainder of two integers, 
# try to work with positive integers exclusively. If you can't, 
# then make sure you know exactly which operator or method you 
# need to use when working with negative integers.



## Integers: no decimal points https://ruby-doc.org/core-3.1.2/Integer.html
# INTEGER / INTEGER = INTEGER
    17    /    5    =    3

## Floats: with decimal points https://ruby-doc.org/core-3.1.2/Float.html
# INTEGER / FLOAT = FLOAT
    17    /   5.0 =  3.4

   17.0   /   5   =  3.4

## Converting Number Types
# Integer to float
13.to_f   #=> 13.0

# String to float
'4.0 hi there'.to_f #=> 4.0
'hi there 4.0'.to_f #=> 0.0

# Float to integer
13.0.to_if #=> 13
13.9.to_if #=> 13 # Doesn't do any rounding

# String to int
'4 hi there'.to_f #=> 4
'hi there 4'.to_f #=> 0

## Some Number Methods
# even
6.even? #=> true
7.even? #=> false

# odd
6.odd? #=> false
7.odd? #=> true







### Strings https://ruby-doc.org/core-3.1.2/String.html
## String literals
"Hello World"
'Hello World'

## Concatenation
# Plus operator
"Welcome " + "to " + "Odin!"   #=> "Welcome to Odin!"

# Shovel operator
"Welcome " << "to " << "Odin!"   #=> "Welcome to Odin!"

# Concat method
"Welcome ".concat("to ").concat("Odin!")   #=> "Welcome to Odin!"

## Substrings
"Hello"[0]  #=> "h"

"hello"[0..1] #=> "he"

"hello"[0, 4] #=> "hell"

"hello"[-1] #=> "o"

## Escape characters
\\    #=> Need a backslash in your string?
\b    #=> Backspace
\r    #=> Carriage return, for those of you that love typewriters
\n    #=> Newline. You'll likely use this one the most.
\s    #=> Space
\t    #=> Tab
"\""  #=> Double quotation mark
"\'"  #=> Single quotation mark

## Interpolation -> Only work with double quote string literals
name = "Odin"

puts "Hello, #{name}"  #=> "Hello, Odin"
puts 'Hello, #{name}'  #=> "Hello, #{name}"

## Some String Methods
# capitalize
"hello".capitalize  #=> "Hello"

# include?
"hello".include?("lo")  #=> true

# upcase
"hello".upcase #=> "HELLO"

# downcase
"Hello".downcase #=> "hello"

# empty?
"hello".empty? #=> false

# length
"hello".length #=> 5

# reverse
"hello".reverse #=> "olleh"

# split
"hello world".split #=> ["hello", "world"]
"hello".split("") #=> ["h", "e", "l", "l", "o"]

#strip
" hello, world   ".strip #=> "hello, world"

# Examples
"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"

## Converting other objects to string
5.to_s       #=> "5"

nil.to_s     #=> ""

:symbol.to_s #=> "symbol"





### Symbols https://ruby-doc.org/core-3.1.2/Symbol.html
# A symbol is created by adding a colon in front of a word. 
:my_symbol

## Symbols are unique identifiers that are considered code, not data. 
## Symbols are a special, limited variation of Strings. 
"string" == "string" #=> true

# Every string is stored in a different memory address
"string".object_id == "string".object_id #=> false

# Stored only once in the memory
:symbol.object_id == :symbol.object_id   #=>true

# Examples of symbols
:name
:a_symbol
:"surprisingly, this is also a symbol"

if nil # false
  puts "Hello, World!"
end

false == nil #=> false






### Booleans
true
false

### Nil
# The object nil represents “nothing”. 
nil
"Hello, World".nil? #=> false

# every operation (“method”) in Ruby always 
# returns exactly one thing (i.e. one object), 
# and that’s why there needs to be a “thing” 
# that represents “nothing”.







# Literals
'Hello, world!'          # string literal
375                      # integer literal
3.141528                 # float literal
true                     # boolean literal
{ 'a' => 1, 'b' => 2 }   # hash literal
[ 1, 2, 3 ]              # array literal
:sym                     # symbol literal
nil                      # nil literal



# Doesn't make implicit conversion
'4' == 4 #=> false

'1' + 1 #=> TypeError: no implicit conversion of Integer into String 








### Arrays
[1, 2, 3, 4, 5]

# Acessing elements
[1, 2, 3, 4, 5][0] # 1



### Hashes
# key and value
# key => usually represented by a symbol
{:dog => 'barks', :cat => 'meows', :pig => 'oinks'}

# Acessing elementes
{:dog => 'barks', :cat => 'meows', :pig => 'oinks'}[:cats] # "meows"