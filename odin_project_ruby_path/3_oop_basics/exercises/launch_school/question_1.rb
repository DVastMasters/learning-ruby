# 1 - Create a superclass called Vehicle for your MyCar class to inherit 
#     from and move the behavior that isn't specific to the MyCar class to the 
#     superclass. Create a constant in your MyCar class that stores 
#     information about the vehicle that makes it different from other 
#     types of Vehicles.

class Vehicle
  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model 
    @speed = 0
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