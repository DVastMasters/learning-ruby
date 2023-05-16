# doc: https://ruby-doc.org/core-3.1.2/Enumerable.html

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

for friend in friends do
  if friend != 'Brian'
    invited_list.push(friend)
  end
end

puts invited_list

puts '-----------'
puts friends.select { |friend| friend != 'Brian' }

puts '-----------'
puts friends.reject { |friend| friend == 'Brian' }

puts '-----------'
friends.each { |friend| puts "Hello, " + friend }



puts '-----------'
my_array = [1, 2]

my_array.each do |num|
  num *= 2
  puts "The new number is #{num}."
end





puts '-----------'
fruits = ["apple", "banana", "strawberry", "pineapple"]

fruits.each_with_index { |fruit, index| puts fruit if index.even?}


friends.map! { |friend| friend.upcase }

puts friends






puts '-----------'
my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

my_order.map! { |item| item.gsub('medium', 'extra large') }

puts my_order


puts '-----------'

friends = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun']
invited_list = []

friends.each do |friend|
  if friend != 'Brian'
    invited_list.push(friend)
  end
end

puts invited_list

invited_list = []

invited_list = friends.select { |friend| friend != 'Brian' }

puts '-----------'
puts invited_list






puts '-----------'

responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
puts responses.select { |person, response| response == 'yes' }



puts '-----------'
my_numbers = [5, 6, 7, 8]
sum = 0

my_numbers.each { |number| sum += number }

puts sum


puts '-----------'
# the initial accumulator value is the argument value from initialValue parameter
# or the first collection value, if the initialValues is not set 
# reduce(initialValue) { |accumulator, nextValue| } 
puts my_numbers.reduce { |sum, number| sum + number }


puts '-----------'
votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

# Default values to keys not found in the hash = 0
votesCount = votes.reduce(Hash.new(0)) do |result, vote|
  result[vote] += 1
  result
end

puts votesCount




# detect
puts '-----------'
songs = [
  { title: 'Mad World', artist: 'Gary Jules', is_sad: true },
  { title: 'California Gurls', artist: 'Katy Perry', is_sad: false },
  { title: 'Needle in the Hay', artist: 'Elliott Smith', is_sad: true },
  { title: 'Happy', artist: 'Pharrell Williams', is_sad: false }
]

sad_song_to_play_now = songs.detect { |song| song[:is_sad] }

puts sad_song_to_play_now

puts '-----------'
# any
pet_names = ['pluto', 'scooby', 'nyan']

find_scooby = pet_names.any? { |pet| pet == 'scooby' }

puts find_scooby

puts '-----------'
ages = [19, 59, 70, 23, 140]
valid = ages.all? { |age| age > 0 && age <= 122 }
puts valid