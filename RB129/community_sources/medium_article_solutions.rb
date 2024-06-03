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

=begin
The reason the previous code did not work was that "self.id=" is in fact a method call, which 
happened to be named exactly the same as the method from where it was being invoked.
"self.id=(value)" is the same as "id=(value)", which causes a recursive loop and resultant SystemStackError. 
=end



# 2 — Define a class of your choice with the following:
# Constructor method that initializes 2 instance variables.
# Instance method that outputs an interpolated string of those variables.
# Getter methods for both (you can use the shorthand notation if you want).
# Prevent instances from accessing these methods outside of the class.
# Finally, explain what concept(s) you’ve just demonstrated with your code.

class Car
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def info
    puts "#@make #@model"
  end
  
  private
  attr_reader :make, :model
end

=begin
The Car class encapsulates a model of attributes and behaviors, from which objects can be created.
Each object creates its own copies of all instance variables, allowing its state to be unique from other instances.
The state of each instance is encapsulated in the object (the instance).

Encapsulation is also achieved in this example through method access control. By setting all the getter methods as private, it prevents that data from being accessed in unwanted ways.
=end