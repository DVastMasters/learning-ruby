my_lambda = lambda { puts "my lambda" }

my_other_lambda = -> { puts "hello from the other side" }

my_lambda.call



my_name = ->(name) { puts "hello #{name}" }
my_age = lambda { |age| puts "I am #{age} years old" }

my_name.call("tim")
my_age.call(78)


my_name.call("tim") # use this
my_name.("tim")
my_name["tim"]
my_name.=== "tim" # wtf?