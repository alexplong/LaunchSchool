# Classes and objects
# Use attr_* to create setter and getter methods
# How to call setters and getters
# Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope
# Instance methods vs. class methods
# Method Access Control
# Referencing and setting instance variables vs. using getters and setters
# Class inheritance, encapsulation, and polymorphism
# Modules and their use cases
# Method lookup path
# self
# Calling methods with self
# More about self
# Reading OO code
# Fake operators and equality
# Working with collaborator objects
# Create a code spike

# Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope

# Instance variables initialized when objects are instantiated with them being scoped at the object level.

class Person
  attr_reader :name, :age

  @@total_people = 0

  def initialize(name, age)
    @name = name
    @age = age

    @@total_people += 1
  end

  
  # Class methods - scoped at the class level
  def self.total_persons
    @@total_people
  end


end

bob = Person.new("Bob", 24)
scott = Person.new("Scott", 28)

puts Person.total_persons
puts bob.total_persons




