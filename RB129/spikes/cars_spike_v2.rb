## CARS SPIKE
# + There is a vehicle company called Cool Car Factory
# + There are 3 trucks and two cars there.
# + A blue garbage truck has orange wheels and picks up garbage 
# + An orange recycling truck has blue wheels and picks up recycling 
# + A purple car called Do Not Touch Anything Dirty has black wheels and if it touches something dirty says "hey don't touch any dirty stuff!" 
# + a green race car that races and has black wheels 
# + A red firetruck with black wheels that puts out fires 
# + All truck/car's of these types would have these same attributes and you can pass only one argument on instantiation 
# + all trucks can carry heavy stuff 
# + all cars and the firetruck can go fast 
# + all vehicles can drive 
# + calling puts on an object of any class should return a sentence describing that object 



##
# There is a vehicle company called Cool Car Factory

class VehicleCompany
  attr_reader :name

  def initialize(name)
    @name = name
    @vehicles = []
  end

  def add(vehicle)
    @vehicles.push(vehicle)
  end

  def to_s
    "This is a #{self.class} called #{name}"
  end
end

puts cool_car_factory = VehicleCompany.new("Cool Car Factory")


# There are 3 trucks and two cars there.

class Vehicle
  attr_reader :color, :wheels_color

  def initialize(input)
    @color = input.split.first
    @wheels_color = input.split.last
  end

  def drive
    "#This #{self.class} can drive."
  end

  def to_s
    "This is a #{color} #{self.class} with #{wheels_color} wheels"
  end
end

class Truck < Vehicle
  def carry_heavy_load
    "#{self} and carries a heavy load!"
  end
end

module Fast
  def go_fast
    "#{self} and goes fast!"
  end
end

class Car < Vehicle
  include Fast
end


# A blue garbage truck has orange wheels and picks up garbage
class GarbageTruck < Truck
  def to_s
    super + " that picks up garbage"
  end
end


# An orange recycling truck has blue wheels and picks up recycling 
class RecyclingTruck < Truck
  def to_s
    super + " that picks up recycling"
  end
end


# A purple car called Do Not Touch Anything Dirty has black wheels and if it touches something dirty says "hey don't touch any dirty stuff!" 
class DoNotTouchAnythingDirtyCar < Car
  def touch(something)
    something.dirty? ? (puts "hey don't touch any dirty stuff!") : nil
  end

  def to_s
    super + " and if it touches something dirty says \"hey don't touch any dirty stuff!\""
  end
end

class Something
  def initialize
    @dirty = false
  end

  def dirty?
    @dirty
  end

  def dirty
    @dirty = true
  end

  def to_s
    dirty? ? "This is dirty" : "This is not dirty"
  end
end

      # # Create something that can get dirty to test
      # puts stuff = Something.new
      # do_not_touch_test_car = DoNotTouchAnythingDirtyCar.new("yellow and purple")

      # # Touch it when it is clean
      # do_not_touch_test_car.touch(stuff)

      # # Make it dirty
      # stuff.dirty
      # puts stuff

      # # Touch it when it is dirty
      # do_not_touch_test_car.touch(stuff)


# a green race car that races and has black wheels 
class RaceCar < Car
  def to_s
    super + " that races"
  end
end


# A red firetruck with black wheels that puts out fires 
class FireTruck < Truck
  include Fast

  def to_s
    super + " that puts out fires"
  end
end


# All truck/car's of these types would have these same attributes and you can pass only one argument on instantiation 
blue_garbage_truck = GarbageTruck.new('blue and orange')
orange_recycling_truck = RecyclingTruck.new('orange and blue')
purple_donottouchanythingdirty_car = DoNotTouchAnythingDirtyCar.new('purple and black')
green_race_car = RaceCar.new('green and black')
red_fire_truck = FireTruck.new('red and black')

p cool_car_factory
cool_car_factory.add(blue_garbage_truck)
cool_car_factory.add(orange_recycling_truck)
cool_car_factory.add(purple_donottouchanythingdirty_car)
cool_car_factory.add(green_race_car)
cool_car_factory.add(red_fire_truck)
p cool_car_factory


# all trucks can carry heavy stuff 
# [blue_garbage_truck, orange_recycling_truck, red_fire_truck].each {|truck| puts truck.carry_heavy_load}

# all cars and the firetruck can go fast 
# [purple_donottouchanythingdirty_car, green_race_car, red_fire_truck].each {|n| puts n.go_fast}

# all vehicles can drive 
# [blue_garbage_truck, orange_recycling_truck, purple_donottouchanythingdirty_car, green_race_car, red_fire_truck].each {|n| puts n.drive}

# calling puts on an object of any class should return a sentence describing that object 
# [blue_garbage_truck, orange_recycling_truck, purple_donottouchanythingdirty_car, green_race_car, red_fire_truck].each {|n| puts n}