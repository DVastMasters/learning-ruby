class Student
  attr_accessor :name

  def initialize(n, g)
    self.name = n
    self.grade = g
  end

  def better_grade_than?(other_student)
    self.grade > other_student.grade
  end

  protected
  attr_accessor :grade
end

joe = Student.new("Joe", 7)
bob = Student.new("Bob", 10)

puts joe.better_grade_than?(bob)
puts bob.better_grade_than?(joe)