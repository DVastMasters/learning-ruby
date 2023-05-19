# 3 - Create a module that you can mix in to ONE of your subclasses 
#     that describes a behavior unique to that subclass.

module Smasheable
  def smash_car
    "Smashing a car..."
  end
end

class Vehicle
  def initialize
  end
end

class Car < Vehicle
  NUMBER_OF_DOORS = 4
end

class Truck < Vehicle
  include Smasheable

  NUMBER_OF_DOORS = 2
end

puts "---Truck Methods Lookup---"
puts Truck.ancestors
puts "---Car Methods Lookup---"
puts Car.ancestors
puts "---Vehicle Methods Lookup---"
puts Vehicle.ancestors