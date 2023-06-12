module Enumerable
  # Your code goes here
  def my_each_with_index
    idx = 0
    for i in self
      yield i, idx
      idx += 1
    end
  end

  def my_select
    new_array = []
    for i in self
      new_array << i if yield i
    end
    new_array
  end

  def my_all?
    for i in self
      return false unless yield i
    end
    true
  end

  def my_any?(&block)
    for i in self
      return true if block.call i
    end
    false
  end

  def my_none?(&block)
    for i in self
      return false if block.call i
    end
    true
  end

  def my_count(&block)
    count = 0
    if block_given?
      for i in self
        count += 1 if block.call i
      end
    else
      for i in self
        count += 1
      end
    end
    count
  end

  def my_map
    new_a = []
    for i in self
      new_a << (yield i)
    end
    new_a
  end

  def my_inject(init_value = 0)
    result = init_value
    for i in self
      result = yield result, i
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    for i in self
      block.call i
    end
  end
end
