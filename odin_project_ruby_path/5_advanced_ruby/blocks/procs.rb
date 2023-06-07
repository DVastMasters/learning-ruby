a_proc = Proc.new { puts "this is a proc" }

a_proc.call

a_proc = proc { puts "this is a proc" }

a_proc.call


a_proc = Proc.new { |name, age| puts "name: #{name} --- age: #{age}" }

a_proc.call("tim", 80)


