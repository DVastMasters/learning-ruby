def logger
  yield
end

logger { puts 'hello from the block' }

logger do
  p [1, 2, 3]
end

def double_vision
  yield
  yield 
end

double_vision { puts "How many fingers am I holding up?" }



def love_language
  yield('Ruby')
  yield('Rails')
end

love_language { |lang| puts "I love #{lang}" }




@transactions = [10, -15, 25, 30, -24, -70, 999]

def transaction_statement
  @transactions.each do |transaction|
    yield transaction
  end
end

transaction_statement do |transaction|
  p "%0.2f" % transaction
end



def transaction_statement
  @transactions.each do |transaction|
  p  yield transaction
  end
end

transaction_statement do |transaction|
  "%0.2f" % transaction
end




def transaction_statement
  formatted_transactions = []
  @transactions.each do |transaction|
    formatted_transactions << yield(transaction)    
  end

  p formatted_transactions
end

transaction_statement do |transaction|
  "%0.2f" % transaction
end







def say_something
  yield
end

say_something do |word|
  puts "And then I said: #{word}"
end





def mad_libs
  yield('cool', 'beans', 'burrito') 
end

mad_libs do |adjective, noun| # ignore last argument
  puts "I said #{adjective} #{noun}!"
end





def awesome_method
  hash = {a: 'apple', b: 'banana', c: 'cookie'}

  hash.each do |key, value|
    yield key, value
  end
end

awesome_method { |key, value| puts "#{key}: #{value}"}