require 'json'

#mixin
module BasicSerializable
  
  # should point to a class; change to a diffenrete
  # class (e.g. MessagePack, JSON, YAML) to get a different
  # serialization
  @@serializer = JSON

  def serialize
    obj = {}
    instance_variables.map do |var| 
      obj[var] = instance_variable_get(var)
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse(string)
    obj.keys.each do |key|
      instance_variable_set(key, obj[key])
    end
  end
end

class Person
  include BasicSerializable

  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end

p = Person.new "Rafael", 21, "male"
p p.serialize

p.unserialize (p.serialize)
puts "Name #{p.name}"
puts "Age #{p.age}"
puts "Gender #{p.gender}"





class People
  include BasicSerializable

  attr_accessor :persons

  def initialize
    @persons = []
  end

  def serialize
    obj = @persons.map do |person|
      person.serialize
    end

    @@serializer.dump obj
  end

  def unserialize(string)
    obj = @@serializer.parse string
    @persons = []
    obj.each do |person_string|
      person = Person.new "", 0, ""
      person.unserialize(person_string)
      @persons << person 
    end
  end

  def <<(person)
    @persons << person
  end
end