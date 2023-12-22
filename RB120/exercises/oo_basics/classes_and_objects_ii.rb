# generic greeting i
## Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked

# method invoked on a class
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
# kitty.generic_greeting        # => Returns error
p kitty.class.generic_greeting  # => Good because #class returns the Cat class and the method is a class method

# hello chloe!
## Using the following code, add an instance method named #rename that renames kitty when invoked

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    self.name = name
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name

# identify yourself i
## Using the following code, add a method named #identify that returns its calling object

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

# generic greeting ii
## Using the following code, add two methods: ::generic_greeting and #personal_greeting. 
## The first method should be a class method and print a greeting that's generic to the class. 
## The second method should be an instance method and print a greeting that's custom to the object.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "Meow! My name is #{self.name}"
  end

  def self.generic_greeting
    puts "Meow!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

# counting cats
## Using the following code, create a class named Cat that tracks the number of 
## times a new Cat object is instantiated. The total number of Cat instances should 
## be printed when ::total is invoked.

class Cat
  @@total_cats = 0

  def initialize
    @@total_cats += 1
  end

  def self.total
    puts "You have instantiated #{@@total_cats} cats"
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total

# colorful cat
## Using the following code, create a class named Cat that prints a 
## greeting when #greet is invoked. The greeting should include the 
## name and color of the cat. Use a constant to define the color.

class Cat
  COLOR = "tuxedo"

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello from #{@name} the #{COLOR} cat"
  end

end

kitty = Cat.new('Sophie')
kitty.greet

# identify yourself ii
## Update the following code so that it prints I'm Sophie! when it invokes puts kitty

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{self.name}"
  end
end

kitty = Cat.new('Sophie')
puts kitty

# public secret
## Using the following code, create a class named Person with an instance 
## variable named @secret. Use a setter method to add a value to @secret, 
## then use a getter method to print @secret.

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret

# private secret
## Using the following code, add a method named share_secret that prints the value of @secret when invoked.

class Person
  attr_writer :secret

  def share_secret
    puts secret   # both secret and @secret work sooooo <- that's because secret is the getter method
  end             # and private methods should be accessible within the class

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

# protected secret
## Using the following code, add an instance method named compare_secret that 
## compares the value of @secret from person1 with the value of @secret from person2.

class Person
  attr_writer :secret

  def compare_secret(spy)
    secret == spy.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

person3 = Person.new
person3.secret = 'Shh.. this is a secret!'

puts person1.compare_secret(person2) 
puts person1.compare_secret(person3) 