class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    self.name = n
  end

  def speak
    super + " from GoodDog class"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Spark")
paws = Cat.new

puts sparky.speak           # => Hello!
puts paws.speak             # => Hello!


class Animal2
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog2 < Animal2
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog2.new("Brown")

p bruno





class BadDog < Animal2
  def initialize(age, name)
    super(name)
    @age = age
  end
end

p BadDog.new(2, "bear")




class Animal3
  def initialize
  end
end

class Bear < Animal3
  def initialize(color)
    super() # call initialize com Animal3 without pass any argument
    @color = color
  end
end

bear = Bear.new("black")
p bear








module Swimmable # Ruby convention => use "able" suffix in modules 
  def swim
    "I'm swimming!"
  end
end

class Animal4; end

class Fish < Animal4
  include Swimmable # mixing in Swimmable module
end

class Mammal < Animal4
end

class Cat2 < Mammal
end

class Dog < Mammal
  include Swimmable # mixing in Swimmable module
end



sparky = Dog.new
neemo = Fish.new
paws = Cat.new

puts sparky.swim
puts neemo.swim
# puts paws.swin #NoMethodError












module Walkable
  def walk
    "I'm walking."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal5
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

class GoodDog3 < Animal5
  include Swimmable
  include Climbable
end

puts "---GoodDog3 method lookup---"
puts GoodDog3.ancestors









