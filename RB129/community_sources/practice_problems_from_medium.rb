# 1 — What will the following code output? Why?

class Student
  attr_reader :id
  
  def initialize(name)
    @name = name
    @id
  end
  
  def id=(value)
    self.id = value
  end
end

tom = Student.new("Tom")
tom.id = 45

# On line 17, the `#id=` instance method gets called resulting in recursively calls to itself and ultimately returning a `SystemStackError`.

# This is because `self` within an instance method refers to the instance of the class that is making the method call.
# In this code snippet, `self` returns the calling object referenced by `tom` therefore, `self.id=` is `tom.id=`.



# 2 — Define a class of your choice with the following:
  # + Constructor method that initializes 2 instance variables.
  # + Instance method that outputs an interpolated string of those variables.
  # + Getter methods for both (you can use the shorthand notation if you want).
  # + Prevent instances from accessing these methods outside of the class.
  # - Finally, explain what concept(s) you’ve just demonstrated with your code.

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  def to_s
    "#{name}: #{age}"
  end

  private

  attr_reader :name, :age
end

bob = Person.new("Bob", 21)
bob.name  # => PrivateMethodError
bob.age   # => PrivateMethodError

# The defined Person class encapsulates the blueprint of state and  


# concepts
# - encapsulation:
  # - hiding state
  # - 



# 3 — What concept does the following code aim to demonstrate?

module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

p Teacher.ancestor

tom.greet "Bonjour!"
rob.greet "Hello!"

# polymorphism
# interface inheritance
# modules and mixins
# abstraction of behavior
# DRY

# This code snippet demonstrates the concept of polymorphism through interface inheritance where a common behavior gets extracted to a module
# and then "mixed in" using the `include` keyword/method to provide this behavior the class. 
# The abstraction of this behavior into a module facilitates the act of keeping code "DRY".