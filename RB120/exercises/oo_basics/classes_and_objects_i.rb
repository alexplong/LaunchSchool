# find the class
puts "Hello".class
puts 5.class
puts [1, 2, 3].class

# create the class
## Create an empty class named Cat
class Cat; end

# create the object
## create an instance of Cat and assign it to a variable named kitty
p kitty = Cat.new

# what are you?
## add an #initialize method that prints I'm a cat! when a new Cat object is instantiated

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty2 = Cat.new

# hello sophie!
## add a parameter to #initialize that provides a name for the Cat object. 
## Use an instance variable to print a greeting with the provided name. 
## (You can remove the code that displays I'm a cat!.)

class Cat
  def initialize(name)
    @name = name
    puts "Meow #{@name}"
  end
end

kitty3 = Cat.new("Sophie")

# hello sophie! again
## move the greeting from the #initialize method to an instance method named #greet that prints a greeting when invoked

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Meow #{@name}"
  end
end

kitty4 = Cat.new("Sophie2")
kitty4.greet

# reader
## add a getter method named #name and invoke it in place of @name in #greet

class Cat
  # attr_reader :name

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def greet
    puts "Meow #{name}"
  end
end

kitty5 = Cat.new("Sophie3")
kitty5.greet

# writer
## add a setter method named #name=. Then, rename kitty to 'Luna' and invoke #greet again

class Cat
  attr_reader :name
  # attr_writer :name # can also add this

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

# accessor
## Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

class Cat
  # attr_reader :name
  # attr_writer :name
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet

# walk the cat
## create a module named Walkable that contains a method named #walk. 
## This method should print Let's go for a walk! when invoked. 
## Include Walkable in Cat and invoke #walk on kitty

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk