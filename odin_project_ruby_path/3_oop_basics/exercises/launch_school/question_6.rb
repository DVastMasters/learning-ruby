# 4 - Print to the screen your method lookup for the classes that 
#     you have created.

class Vehicle
  attr_accessor :color, :speed
  attr_reader :year, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model 
    @speed = 0
    @@vehicles_count += 1
  end

  def age
    Time::now.year - self.year
  end
end

class Car < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "The car is #{color}, #{year}, #{model}."
  end
end

class Truck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "This truck is #{color}, #{year}, #{model}."
  end
end