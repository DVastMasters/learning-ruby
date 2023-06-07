# Binding to variables currently does NOT work for alternative patterns joined with |:
=begin 
case {a: 1, b: 2}
in {a: } | Array # illegal variable in alternative pattern (a)
  puts "matched #{a}"
else
  puts "not matched"
end
=end

# Variables that start with _ are the only exclusions from this rule:
case {a: 1, b: 2}
in {a: _, b: _foo} | Array
puts "matched #{_}, #{_foo}"
else
  puts "not matched"
end


jane = {school: 'high', schools: [{id: 1, level: 'middle'}, {id: 2, level: 'high'}]}
john = {school: 'high', schools: [{id: 1, level: 'middle'}]}

case jane
in school:, schools: [*, {id:, level: ^school}]
  puts "matched. school: #{id}"
else
  puts "not matched"
end

case john
in school:, schools: [*, {id:, level: ^school}]
  puts "matched. school: #{id}"
else
  puts "not matched"
end



class Point
  def initialize(x, y)
    @x, @y = x, y
  end
  
  def deconstruct
    puts "desconstruct called"
    [@x, @y]
  end

  def deconstruct_keys(keys)
    puts "desconstruct_keys called with #{keys.inspect}"
    {x: @x, y: @y}
  end
end

case Point.new(1, -2)
in px, Integer
  puts "matched #{px}"
else
  puts "not matched"
end

case Point.new(1, -2)
in x: 0.. => px
  puts "matched: #{px}"
else
  puts "not matched"
end

case Point.new(1, -2)
  in x: 0.. => px, **rest
    puts "matched: #{px}"
  else
    puts "not matched"
  end