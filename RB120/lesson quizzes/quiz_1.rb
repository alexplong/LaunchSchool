# Q15
class Person
  attr_writer :first_name, :last_name

  def full_name
    # omitted code
    @first_name + ' ' + @last_name            ## solution 1
    self.first_name + ' ' + self.last_name    ## incorrect but why? see line 33
  end
end

mike = Person.new
mike.first_name = 'Michael'
mike.last_name = 'Garcia'
mike.full_name # => 'Michael Garcia'


#Q16
class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  ## solution 1
  def change_grade(new_grade)
    @grade = new_grade
  end

  ## solution 2
  def change_grade(new_grade)                  ## line 8 solution is 'getter' which is why it may be incorrect
    self.grade = new_grade                     ## here, self is used for reassignment
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
priya.grade # => "A"