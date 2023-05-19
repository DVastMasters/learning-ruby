# Given the following code...
bob = Person.new
bob.hi

# And the corresponding error message...
# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>

# What is the problem and how would you go about fixing it?
# The method hi is defined with private in the Person class.
# To fix, simply remove the "private" modifier or move the method
# to above the "private" keyword