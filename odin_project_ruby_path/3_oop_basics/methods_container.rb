module Mammal
  def self.some_out_of_place_method(num)
    num ** 2
  end
end

value = Mammal.some_out_of_place_method(4)

puts value

value = Mammal::some_out_of_place_method(2)

puts value