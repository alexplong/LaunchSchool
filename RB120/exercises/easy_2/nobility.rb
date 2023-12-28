module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Person
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name}"
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name}"
  end
  
  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name}"
  end

  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :name, :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end
end


byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"


mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"