## Arguments 

a_proc = Proc.new { |a, b| puts "a: #{a} --- b: #{b}" }

a_proc.call("apple") # Proc doesn't care if you pass in fewer or more arguments

a_lambda = lambda { |a, b| puts "a: #{a} --- b: #{b}" }

# a_lambda.call("apple") #ArgumentError



## Returning

# A lambda will return normally, like a regular method.

# But a proc will try to return from the current context.

a_lambda = -> { return 1 }

puts a_lambda.call

a_proc = Proc.new { return }

# puts a_proc.call # End the execution


def my_method
  a_proc = Proc.new { return }
  puts "this line will be printed"
  a_proc.call
  puts "this line is never reached"
end

my_method

puts '--------------'
def my_method
  a_proc = -> { return }
  puts "this line will be printed"
  a_proc.call
  puts "this line will be printed"
end

my_method



=begin
Lambdas are defined with -> {} and procs with Proc.new {}.
Procs return from the current method, while lambdas return from the lambda itself.
Procs don’t care about the correct number of arguments, while lambdas will raise an exception.
=end