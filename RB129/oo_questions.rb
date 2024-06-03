# -----------------------------------------------------------------------------
# What is encapsulation?
# How does encapsulation relate to the public interface of a class?
# How do objects encapsulate state?

class Person
  def initialize(name, age, favorite_color)
    @name = name
    @age = age
    @fav_color = favorite_color
  end
end



  # 1st => Encapsulation is the act of protecting access to information and functionality so that they are unavailable to the rest of the code base. This is how we can ensure data is only intentionally accessed and correctly manipulated, making data encapsulated.

  # 1-ai => # Encapsulation is the practice of restricting access to an object's information and functionality, ensuring they are only available through well-defined interfaces. This safeguards data from unintended access and manipulation, promoting data integrity.

  # 2-ai => # Encapsulation is the practice of bundling an object's data (state) and functionality (methods) together, hiding the internal details and implementation. This ensures that the data is not directly accessible from the outside and can only be manipulated through well-defined interfaces. Access control mechanisms further protect both the data and methods, promoting a clear separation between the object's internal workings and its external usage.

  # => Encapsulation is the act of hiding state and 





  # => In Ruby, an objects state and behavior (stored in instance variables and defined instance methods, respectively) are encapsulated, meaning they are only accessed by the object itself.
  # => Behavior of an object can be further encapsulated through use of *method access control* so that even the object itself does not have access to them.
  # => Use of *method access control* allows us to qualify specific instance methods as public, private, or protected, which affects how accessible these interfaces are to the public domain.

# Ruby, like many other OO languages, accomplishes this task by creating objects, and exposing interfaces (i.e., methods) to interact with those objects


# -----------------------------------------------------------------------------
# What is the difference between classes and objects?
# How can we expose information about the state of the object using instance methods?




  # => Objects encapsulate state by scoping state at the object level. While all objects have a property, the data for that property
  # => will be different among objects. While objects encapsulate state, classes are what group common behaviours toegether.
  # => Instance methods can be defined to expose instance variables which contains raw data for an objects state. 


# -----------------------------------------------------------------------------
# What is a class?
# What is an object?
# What is instantiation?

class Car
  def initialize(year, color)
    @year = year
    @color = color
  end
end

toyota_supra = Car.new(1995, 'black')
mazda_rx7 = Car.new(1993, 'yellow')

toyota_supra != mazda_rx7
toyota_supra.class == mazda_rx7.class

  # => A class is what defines the states and behaviors of its objects.
  # => States would reference what properties an object should have and behaviors are what objects are able to do.
  # => Objects are created from classes. Individual objects will contain different information from other objects.
  # => They are also instances of a same class. 
  # => The workflow of creating a new object/instance from a class is instantiation.


# -----------------------------------------------------------------------------
# What is polymorphism?
# Explain two different ways to implement polymorphism.
# How does polymorphism work in relation to the public interface?
# What is duck typing? How does it relate to polymorphism - what problem does it solve?

## Inheritance
class Animal
  def move; end # logic for most basic way of moving
end

class Dog < Animal
  def move
    'walks on all four' # logic for walking on all four
  end
end

class Snake < Animal
  def move
    'slithers' # logic for slithering
  end
end

class Bird < Animal
  def move
    'flies' # logic for flying
  end
end

class Coral < Animal; end
class Sponge < Animal; end

sparky = Dog.new
snek = Snake.new
birdy = Bird.new
coral = Coral.new
sponge = Sponge.new

puts [sparky, snek, birdy, coral, sponge].map(&:move)

  # => Polymorphism is the ability for different object types to respond to the same method invocation.
  # => We use polymorphism when we don't care what the object type is that is invoking the method.

  # => Inheritance is one of two ways to apply polymorphism
  # => Here `#move` behavior is inherited to subclasses from the Animal class superclass.
  # => Through polymorphism, subclasses inheriting from Animal can override a method of the superclass.
  # => Here Dog, Snake, and Bird classes overwrite the `#move` method, allowing `#move` to do different things in those subclasses.

  # => The client code can treat them all as a generic animal object that can move. This provides a public interface that lets us work
  # => with all of these different object types in the same way even though the implementations can be drastically different underneath the hood.


## Duck Typing
class Score
  def initialize
    reset
  end

  def reset
    @score = 0
  end
end

class Move
  def initialize
    reset
  end

  def reset
    @move = nil
  end
end

class Round
  def initialize
    reset
  end

  def reset
    @winner = nil
  end
end

class Player
  attr_accessor :score, :move

  def initialize
    @score = Score.new
    @move = Move.new
  end
end


  # => Polymorphism through duck typing is when objects of unrelated types that can respond to the same method name invocation.
  # => Here `#reset` behavior implemented so objects can reset to an initial state.
  # => If an object can quack, then we act as if that object is a duck. In a sense, if it can reset, we treat it as a resetable object.

  # => Similarly to what's happening with inheritance, duck typing provides us with a public interface with now objects on unrelated types
  # => and allows us to work with them in the same manner even though the implentation details for each one are different under the hood.


# -----------------------------------------------------------------------------
# What is inheritance?
# + What is the difference between a superclass and a subclass?
# + What is a module?
# + What is a mixin?

class Phone
  attr_reader :number

  def initialize(num)
    @number = num
  end
end

class MobilePhone < Phone
  def WirelessData; end
end

p bb = MobilePhone.new(8675309)
p bb.number

  # => Inheritance is when a class inherits the behaviors from another class.
  # => The superclass is the class that gets inherited from, Phone in this example.
  # => The subclass, MobilePhone, is the class that inherits from the superclass. 
  # => While `attr_reader` for `@name` is defined in the superclass, the subclass MobilePhone 

module ICloud
  def icloud
    @cloud_data = []
  end
end

class IPhone < MobilePhone
  include ICloud
end

p iphone = IPhone.new(123456789)
p iphone.icloud

  # => A module is a collection of behaviors that are usable in classes via mixins where behaviors get mixed in with classes.
  # => Here, the ICloud module is mixed in using `include` so that objects of the IPhone class can access `#icloud`.
  # => Why module for `ICloud` when it can be included in the subclass IPhone?
  
class IPad
  include ICloud
end

class MacBook
  include ICloud
end

  # => Since we have IPods, IPads, MacBooks, etc. it's likely ICloud behavior will be shared so we can extract it to a module.


# -----------------------------------------------------------------------------
# When is it good to use inheritance?
# In inheritance, when would it be good to override a method?
# What is the method lookup path?


# -----------------------------------------------------------------------------
# When defining a class, we usually focus on state and behaviors. What is the difference between these two concepts?
# How do you initialize a new object?
# What is an instance variable, and how is it related to an object?
# What is an instance method?
# What is a constructor method?

class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def say_hello
    puts "Hi there! I'm #{name}"
  end
end

bob = Person.new('Bob', 24)
sam = Person.new('Sam', 25)

  # => State would be data associated with an object that are tracked with instance variables that is scoped at the object level (data associated with these variables are not shared amonst objects).
  # => Behaviors would be what the objects are capable of doing. [[Instance methods expose the behaviors of a class and they are shared to all objects.]]

  # => A constructor method is the initialize method that is immediately invoked when the class method `new` is invoked on a class.


# -----------------------------------------------------------------------------
# What is a collaborator object, and what is the purpose of using collaborator objects in OOP?


# -----------------------------------------------------------------------------
# What is an accessor method?
# What is a getter method?
# What is a setter method?
# What is attr_accessor?


# -----------------------------------------------------------------------------
# How do you decide whether to reference an instance variable or a getter method?


  # => Using a getter method provides data security by defining and setting in place
  # => security measures that won't fully expose an instance variable to the public
  # => interface. 


# -----------------------------------------------------------------------------
# When would you call a method with self?
# What are class methods?


# -----------------------------------------------------------------------------
# What is the purpose of a class variable?


# -----------------------------------------------------------------------------
# What is a constant variable?


# -----------------------------------------------------------------------------
# What is the default to_s method that comes with Ruby, and how do you override this?
# What are some important attributes of the to_s method?


# -----------------------------------------------------------------------------
# From within a class, when an instance method uses self, what does it reference?
# What happens when you use self inside a class but outside of an instance method?


# -----------------------------------------------------------------------------
# Why do you need to use self when calling private setter methods?
# Why use self, and how does self change depending on the scope it is used in?


# -----------------------------------------------------------------------------
# What is inheritance, and why do we use it?
# Give an example of how to use class inheritance.
# Give an example of overriding. When would you use it?


# -----------------------------------------------------------------------------
# Give an example of using the super method. When would we use it?
# Give an example of using the super method with an argument.


# -----------------------------------------------------------------------------
# When creating a hierarchical structure, under what circumstance would a module be useful?
# What is interface inheritance, and under what circumstance would it be useful in comparison to class inheritance?


# -----------------------------------------------------------------------------
# How is the method lookup path affected by module mixins and class inheritance?

# -----------------------------------------------------------------------------
# What is namespacing?

# -----------------------------------------------------------------------------
# How does Ruby provide the functionality of multiple inheritance?

# -----------------------------------------------------------------------------
# Describe the use of modules as containers.

# -----------------------------------------------------------------------------
# What is the private method call used for?
# What is the protected keyword used for?
# What are two rules of protected methods?

# -----------------------------------------------------------------------------
# Why should a class have as few public methods as possible?

# -----------------------------------------------------------------------------
# Why is it generally a bad idea to override methods from the Object class, and which method is commonly overridden?

# -----------------------------------------------------------------------------
# Understand how sub-classing or mixing in modules affects the method lookup path

# -----------------------------------------------------------------------------
# How does equivalence work in Ruby?
# How do you determine if two variables actually point to the same object?
# What is == in Ruby? How does == know what value to use for comparison?
# What do you get “for free” when you define a == method?

# -----------------------------------------------------------------------------
# What is the eql? method?

# -----------------------------------------------------------------------------
# Is it possible to compare two objects of different classes?

# -----------------------------------------------------------------------------
# What is the === method?

# -----------------------------------------------------------------------------
# What is the scoping rule for instance variables?

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

person_1 = Person.new('Bobby', 20)
person_2 = Person.new('Steve', 21)

person_1.name == 'Bobby'
person_1.name != 'Steve'

# => Instance variables are scoped at the object level and not shared between objects.
# => Both objects share name and age properties that are stored in instance variables.
# => However each object stores its own state and that data is not shared amongst objects.


# -----------------------------------------------------------------------------
# What are the scoping rules for class variables? What are the two main behaviors of class variables?

class Animal
  @@total_animals = 0

  def initialize
    @@total_animals += 1
  end

  def self.total_animals
    @@total_animals
  end
end

module ThisReturnsNameError
  def see_total_animals
    @@total_animals
  end
end

class Dog < Animal
  # include ThisReturnsNameError

  def see_total_animals
    @@total_animals
  end
end

class Cat < Animal; end

Dog.new
Cat.new

# puts Animal.total_animals

x = Dog.new
# puts x.see_total_animals

  # => Class variables are scoped at the class level with all objects sharing a single copy
  # => of the class variable (implies instance methods can also access/expose class variable).
  # => Class methods can access the class variable given it has been initialized prior
  # => to calling the method.

  # => Interestingly, trying to expose a class variable from inside a module returns an uninitialized class variable NameError.
  # => Modules play by different rules when trying to access it from a method inside of a module (NameError)


# -----------------------------------------------------------------------------
# What are the scoping rules for constant variables?

module HasConstant
  SAMPLE_DATA = 'I am in a module.'
end

class Foo
  def get_const_from_super
    SAMPLE_DATA
  end
end

class Bar < Foo
  include HasConstant

  def get_const_from_sub
    SAMPLE_DATA
  end
end

x = Bar.new
# puts x.class.ancestors
# puts x.get_const_from_sub
# puts x.get_const_from_super
# => Where the constant is defined and where the constant is referenced are both important
# => in terms of constant scope.

# => When defined in a module ...

# -----------------------------------------------------------------------------
# How does sub-classing affect instance variables? How does mixing in modules affect instance variables?

# =>
# =>
# =>
# =>

# -----------------------------------------------------------------------------
# Are class variables accessible to sub-classes?
# Why is it recommended to avoid the use of class variables when working with inheritance?

# -----------------------------------------------------------------------------
# Is it possible to reference a constant defined in a different class?
# What is the namespace resolution operator?
# How are constants used in inheritance?

# -----------------------------------------------------------------------------
# What is lexical scope?
# When dealing with code that has modules and inheritance, where does constant resolution look first?

# -----------------------------------------------------------------------------
# When do shift methods make the most sense?

# -----------------------------------------------------------------------------
# Explain how the element getter (reference) and setter methods work, and their corresponding syntactical sugar.

# -----------------------------------------------------------------------------
# How is defining a class different from defining a method?

# -----------------------------------------------------------------------------
# When you have a mixin and you use a ruby shorthand accessor method, how do you write the code (what order do you write the getter/setters and the mixin)? What about using a constant?

# -----------------------------------------------------------------------------
# When do you use empty parentheses with super?

# -----------------------------------------------------------------------------
# What is namespacing, and how do you instantiate a class contained in a module?
