# 2 - Add a class variable to your superclass that can keep track of the number of 
#     objects created that inherit from the superclass. Create a method to print 
#     out the value of this class variable as well.

class Vehicle
  attr_accessor :color, :speed
  attr_reader :year, :model

  @@vehicles_count = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model 
    @speed = 0
    @@vehicles_count += 1
  end

  def change_speed(value)
    self.speed += value
  end

  def spray_paint(color)
    self.color = color
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def self.how_much_vehicles
    @@vehicles_count
  end
end

class Car < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "The car is #{color}, #{year}, #{model}."
  end
end

# Then create a new class called MyTruck that inherits from your superclass that 
# also has a constant defined that separates it from the MyCar class in some way.

class Truck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is #{color}, #{year}, #{model}."
  end
end


my_car = Car.new(2021, "red", "ab-2")
my_truck = Truck.new(2022, "black", "tr-1")
p my_car
p my_truck

puts Vehicle.how_much_vehicles