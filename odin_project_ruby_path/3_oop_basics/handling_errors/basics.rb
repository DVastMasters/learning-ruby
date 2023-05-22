a = 10
b = "42"

begin
  a + b
rescue 
  puts "Could not add varibles a (#{a.class}) and b (#{b.class})"
else
  puts "a + b is #{a + b}"  
end

values = [42, 'a', 'r', 9, 5, 10022, 8.7, "sharon", "Libya", "Mars", "12", 98, rand + rand, {:dog=>'cat'}, 100, nil, 200.0000, Object, 680, 3.14, "Steve", 78, "Argo"].shuffle

while values.length > 0
  a = values.pop
  b = values.pop

  begin
    a + b
  rescue 
    puts "Could not add varibles a (#{a.class}) and b (#{b.class})"
  else
    puts "a + b is #{a + b}"  
  end
end

while 1
  puts "Enter a number>>"
  begin 
    num = Kernel.gets.match(/\d+/)[0]
  rescue
    puts "Erroneous input! Try again..."
  else
    puts "#{num} + 1 is: #{num.to_i + 1}"
  end
end