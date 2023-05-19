class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  def older?(other_dog)
    age > other_dog.human_years # This isn't possible
  end

  private # Everything under is private

  def human_years
    age * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
# sparky.human_years # private method `human_years' called for #<GoodDog:
puts sparky.public_disclosure

dino = GoodDog.new("Dino", 6)
# puts sparky.older?(dino) # private method `human_years' called for #<GoodDog



class Person
  def initialize(age)
    @age = age
  end

  def older?(other_person)
    age > other_person.age # This is possible
  end

  protected

  attr_reader :age 
end

malory = Person.new(64)
sterling = Person.new(42)

puts malory.older?(sterling)
puts sterling.older?(malory)

# malory.age # protected method `age' called for #<Person: