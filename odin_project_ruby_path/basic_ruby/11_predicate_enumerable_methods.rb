numbers = [5, 6, 7, 8]

puts numbers.include?(6)

puts numbers.include?(3)

responses = {
  'Sharon' => 'yes',
  'Leo' => 'no',
  'Brinan' => 'yes'
}

puts responses.include?('yes')
puts responses.include?('Sharon')


puts '--------'
numbers = [21, 42, 303, 499, 550, 811]

puts numbers.any? { |number| number > 500 }
puts numbers.any? { |number| number < 20 }


puts '----'
fruits = ["apple", "banana", "strawberry", "pineapple"]

puts fruits.all? { |fruit| fruit.length > 3 }
puts fruits.all? { |fruit| fruit.length > 5 }
puts [].all? { |element| element > 1 } # true

puts '------'
puts fruits.none? { |fruit| fruit.length > 10 } # true
puts fruits.none? { |fruit| fruit.length > 6 } # false



puts '-----'
fruits << "Mangos"
puts fruits.one? { |fruit| fruit.length == 6 } # false
puts fruits.one? { |fruit| fruit.length == 10 } # true
puts ["a"].one? # true
puts [].one? # false
puts [nil].one? # false



puts '-------'
puts [:orange, :apple, :coconut].any?(Symbol) # true
puts [1, 2, 3].all?(1..10) # true

