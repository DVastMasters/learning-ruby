require 'msgpack'

msg = {
  height: 47,
  width: 32,
  depth: 16
}.to_msgpack

p msg

obj = MessagePack.unpack(msg)
p obj

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_msgpack
    MessagePack.dump ({
      :name => @name,
      :age => @age,
      :gender => gender
    })
  end

  def self.from_msgpack(string)
    data = MessagePack.load string
    p data
    self.new(data[:name], data[:age], data[:gender])
  end
end

p = Person.new "David", 28, "male"
p p.to_msgpack

p = Person.from_msgpack(p.to_msgpack)
puts "Name #{p.name}"
puts "Age #{p.age}"
puts "Gender #{p.gender}"
