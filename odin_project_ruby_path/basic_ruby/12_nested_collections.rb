test_scores = [
  [97, 76, 79, 93],
  [79, 84, 76, 79],
  [88, 67, 64, 76],
  [94, 55, 67, 81]
]

teacher_mailboxes = [
  ["Adams", "Baker", "Clark", "Davis"],
  ["Jones", "Lewis", "Lopez", "Moore"],
  ["Perez", "Scott", "Smith", "Young"]
]

puts teacher_mailboxes[0][0]
puts teacher_mailboxes[1][0]
puts teacher_mailboxes[2][0]

# teacher_mailboxes[3][0] # NoMethodError: undefined method `[]' for nil:NilClass
puts teacher_mailboxes.dig(3, 0) # nil
puts teacher_mailboxes[0][4] # nil


mutable = Array.new(3, Array.new(2))
p mutable # [[nil, nil], [nil, nil], [nil, nil]]
mutable[0][0] = 1000
p mutable # [[1000, nil], [1000, nil], [1000, nil]]

immutable = Array.new(3) { Array.new(2) }
p immutable # [nil, nil], [nil, nil], [nil, nil]]
immutable[0][0] = 1000
p immutable # [1000, nil], [nil, nil], [nil, nil]]

test_scores = [
  [1, 2, 3]
]
p test_scores
test_scores << [100, 99, 98, 97]
p test_scores # [[1, 2, 3], [100, 99, 98, 97]]

teacher_mailboxes.each_with_index do |row, row_index|
  puts "Row:#{row_index} = #{row}"
end

teacher_mailboxes.each_with_index do |row, row_index|
  row.each_with_index do |teacher, column_index|
    puts "Row:#{row_index} Column: #{column_index} = #{teacher}"
  end
end

teacher_mailboxes.flatten.each do |teacher|
  puts "#{teacher} is amazing!"
end

test_scores = [
  [97, 76, 79, 93], 
  [79, 84, 76, 79], 
  [88, 67, 64, 76], 
  [94, 55, 67, 81]
]

any_student_passes = test_scores.any? do |scores|
  scores.all? { |score| score > 80 }
end

puts any_student_passes

all_students_have_a_least_one_score_greater_than_80 = test_scores.all? do |scores|
  scores.any? { |score| score > 80 }
end

puts all_students_have_a_least_one_score_greater_than_80


vehicles = {
  alice: {year: 2019, make: "Toyta", model: "Corolla"},
  blake: {year: 2020, make: "Volkswagen", model: "Beetle"},
  caleb: {year: 2020, make: "Honda", model: "Accord"}
}

puts vehicles[:alice][:year]

# vehicles[:zoe][:year] # NoMethodError: undefined method `[]' for nil:NilClass
puts vehicles.dig(:zoe, :year) # nil

p(vehicles.select { |name, data| data[:year] >= 2020 })
p(vehicles.collect { |name, data| name if data[:year] >= 2020 })
p(vehicles.collect { |name, data| name if data[:year] >= 2020 }.compact)

p(vehicles.filter_map { |name, data| name if data[:year] >= 2020 })