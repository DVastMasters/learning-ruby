# 2 spaces to indentation
# Method, variable, or file => snake_case
def this_is_a_great_method
  # do stuff
end

forty_two = 42

this_is_a_snake_cased_file.rb

# Constants => uppercase letters
FOUR = 'four'

## When working with do/end blocks, prefer { } when the entire code expression fits on one line.

# Multi-line
[1, 2, 3].each do |i|
  # do stuff
end

# Single-line
[1, 2, 3].each { |i| do_some_stuff }

# Naming classes => CamelCase
class MyFirstClass
end