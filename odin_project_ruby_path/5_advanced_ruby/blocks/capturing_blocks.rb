def cool_method(&my_block)
  my_block.call
end

cool_method { puts "cool" }


arr = ["1", "2", "3"]

arr.map(&:to_i) # Ruby call :to_i.to_proc and & interpret the proc object as a block



def cool_method
  yield
end

my_proc = Proc.new { puts "proc party" }

cool_method(&my_proc)