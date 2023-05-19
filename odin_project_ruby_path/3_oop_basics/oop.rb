module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak # mixin
end

class HumanBeing
  include Speak # mixin
end

sparky = GoodDog.new
sparky.speak("Arg!")
bob = HumanBeing.new
bob.speak("Hello!")

puts "---GoodDog ancestors---"
puts GoodDog.ancestors


puts "---CHAPTER 2---"




class GoodDog
  def initialize
    puts "This object was initialized"
  end
end

sparky = GoodDog.new


class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(n)
    @name = n
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
fido = GoodDog.new("Fido")
puts sparky.speak
puts fido.speak
puts sparky.name
sparky.name = "Spartacus" # Always return the argument passed
puts sparky.name



puts "---Ruby syntax sugar---"


class GoodDog
  attr_accessor :name, :height, :weight
  # attr_writter to only set methods
  # attr_reader to only get methods

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new("Sparky", "12 inches", "10 lbs")
puts sparky.info

sparky.change_info("Spartacus", "24 inches", "45 lbs")
puts sparky.info


puts "---Exercises---"

# 1 - Create a class called MyCar. When you initialize a new 
#     instance or object of the class, allow the user to define 
#     some instance variables that tell us the year, color, and 
#     model of the car. Create an instance variable that is set 
#     to 0 during instantiation of the object to track the current 
#     speed of the car as well. Create instance methods that allow 
#     the car to speed up, brake, and shut the car off.

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model 
    @speed = 0
  end

  def change_speed(value)
    self.speed += value
  end
end

car = MyCar.new(2021, "Red", "A-bn")
car.change_speed(150)
car.change_speed(-40)
car.speed = 0


# 2 - Add an accessor method to your MyCar class to change and view the 
#     color of your car. Then add an accessor method that allows you to view, 
#     but not modify, the year of your car.

class MyCar
  attr_accessor :color, :speed
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model 
    @speed = 0
  end

  def change_speed(value)
    self.speed += value
  end
end

# 3 - You want to create a nice interface that allows you to accurately 
#     describe the action you want your program to perform. Create a method 
#     called spray_paint that can be called on an object and will modify the 
#     color of the car.

class MyCar
  attr_accessor :color, :speed
  attr_reader :year

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
end








puts "---CHAPTER 3---"

class GoodDog
  attr_accessor :name, :height, :weight
  # attr_writter to only set methods
  # attr_reader to only get methods

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def self.what_am_i # Class method
    "I'm a GoodDog class!"
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end

puts GoodDog.what_am_i



class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs



class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def to_s 
    "This dog's name is #{name} and it is #{age} in dog years."
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age
puts sparky
p sparky

puts "#{sparky}" # Call to_s method in interpolation







# self inside a instance method = refer to instance objects
# self outside a instance method = refer to class
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h 
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end

  puts self
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self


puts "---EXERCISES---"
# 1 - Add a class method to your MyCar class that calculates the gas 
#     mileage (i.e. miles per gallon) of any car.

class MyCar
  attr_accessor :color, :speed
  attr_reader :year

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

# 2 - Override the to_s method to create a user friendly print out of your object.

class MyCar
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

  def to_s
    "The car has a #{color} color, is from #{year} year and has the #{model} model."
  end

end

a = MyCar.new(2021, "red", "ab-n")
puts a


# 3 - When running the following code...
class Person
  # attr_reader :name original
  attr_accessor :name
  def initialize(name)
    @name = name
  end  
end

bob = Person.new("Steve")
bob.name = "Bob"

=begin
   We get the following error...
undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

Why do we get this error and how do we fix it?
=end

# Doesnt exists a method to set the person name
# just change the attr_reader to attr_accessor










