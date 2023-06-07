def call_proc(my_proc)
  count = 500
  my_proc.call
end

count = 1
my_proc = Proc.new { puts count }

call_proc(my_proc)


my_lambda = lambda {puts count}
call_proc(my_lambda)