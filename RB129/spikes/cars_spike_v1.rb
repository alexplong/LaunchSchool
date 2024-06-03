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

class VehicleCompany
  attr_accessor :vehicles
  attr_reader :name
  
  def initialize(name)
    @name = name
    @vehicles = []
  end

  def <<(vehicle)
    vehicles << vehicle
  end

  def to_s
    "This is a vehicle company called #{name}"
  end
end

module VehiclesOfferable
  AVAILABLE_VEHICLES = {
    :blue_garbage_truck => {
                    paint: "blue",
                    function: "picks up garbage",
                    wheels_color: "orange",
                    type: "garbage truck"
                                                },
    :orange_recycling_truck => {
                    paint: "orange",
                    function: "picks up recycling",
                    wheels_color: "blue",
                    type: "recycling truck"
                                                },
    :purple_car => {
                    paint: "purple",
                    function: "says 'hey don't touch any dirty stuff!' if it touches something dirty",
                    wheels_color: "black",
                    type: "car"
                                                },
    :green_race_car => {
                    paint: "green",
                    function: "races",
                    wheels_color: "black",
                    type: "race car"
                                                },
    :red_firetruck => {
                    paint: "red",
                    function: "puts out fires",
                    wheels_color: "black",
                    type: "firetruck"
                                                }
    }
end

module Touchable
  def touch(something)
    touched_something_dirty if something.dirty?
  end

  def touched_something_dirty
    puts "hey don't touch any dirty stuff!"
  end
end

module Driveable
  def driveable?
    true
  end
end

module Fastable
  def go_fast?
    true
  end
end

class Vehicle
  include VehiclesOfferable
  include Driveable

  attr_reader :paint, :function, :wheels_color, :type, :fast

  def initialize(vehicle_choice)
    @paint = AVAILABLE_VEHICLES[vehicle_choice][:paint]
    @function = AVAILABLE_VEHICLES[vehicle_choice][:function]
    @wheels_color = AVAILABLE_VEHICLES[vehicle_choice][:wheels_color]
    @type = AVAILABLE_VEHICLES[vehicle_choice][:type]
  end

  def to_s
    a_or_an = paint.start_with?(/[aeiou]/i) ? "an" : "a"

    sentence_end = case type
                   when "garbage truck", "recycling truck" then "has #{wheels_color} wheels and #{function}."
                   when "car" then "that has #{wheels_color} wheels and #{function}."
                   when "race car" then "that #{function} and has #{wheels_color} wheels."
                   when "firetruck" then "with #{wheels_color} wheels that #{function}."
                   end

    "This is #{a_or_an} #{paint} #{type} " + sentence_end
  end
end

class Truck < Vehicle
  def can_carry_heavy_stuff?
    true
  end
end

class Car < Vehicle
  include Touchable
  include Fastable
end

class RaceCar < Vehicle
  include Fastable
end

class FireTruck < Truck
  include Fastable
end

class Something
  attr_accessor :dirty

  def initialize
    @dirty = false
  end

  def dirty?
    dirty
  end

  def to_s
    dirty? ? "This is something dirty." : "This is something not dirty."
  end
end

# There is a vehicle company called Cool Car Factory
cool_car_factory = VehicleCompany.new("Cool Car Factory")
puts cool_car_factory

# There are 3 trucks and two cars there.
# A blue garbage truck has orange wheels and picks up garbage 
cool_car_factory << Truck.new(:blue_garbage_truck)
puts cool_car_factory.vehicles.last

# An orange recycling truck has blue wheels and picks up recycling 
cool_car_factory << Truck.new(:orange_recycling_truck)
puts cool_car_factory.vehicles.last

# A purple car called Do Not Touch Anything Dirty has black wheels and if it touches something dirty says "hey don't touch any dirty stuff!" 
cool_car_factory << Car.new(:purple_car)
puts cool_car_factory.vehicles.last

# a green race car that races and has black wheels 
cool_car_factory << Car.new(:green_race_car)
puts cool_car_factory.vehicles.last

# A red firetruck with black wheels that puts out fires 
cool_car_factory << FireTruck.new(:red_firetruck)
puts cool_car_factory.vehicles.last

# All truck/car's of these types would have these same attributes and you can pass only one argument on instantiation 

# all trucks can carry heavy stuff 
puts (cool_car_factory.vehicles.select do |vehicle|
       vehicle.type == "truck" || vehicle.type == "firetruck"
     end.map(&:can_carry_heavy_stuff?))

# all cars and the firetruck can go fast 
puts (cool_car_factory.vehicles.select do |vehicle| 
        vehicle.type == "car" || vehicle.type == "firetruck"
      end.map(&:go_fast?))

# all vehicles can drive 
puts cool_car_factory.vehicles.map(&:driveable?)

# Test touching something with purple car
puts purple_car = Car.new(:purple_car)

puts something = Something.new
purple_car.touch(something)

something.dirty = true
puts something
purple_car.touch(something)








## GOLDEN GIRLS SPIKE
# + The girls live in a house with an address of 6151 Richmond Street Miami, FL. There are four inhabitants of the house:
# - Dorothy Zbornak
# - Blanche Deveraux
# - Rose Nylund
# - Sofia Petrillo

# All of the girls are American, except for Sofia-- she's Italian. All the girls work, except for Sofia. All of them are widows, except for Dorothy.
# - Only Dorothy stays home on Saturday evenings.
# - Only Rose has a long-term boyfriend.
# - Only Blanche dates younger men.
# - All of the girls are over 50.
# - Dorothy has an ex-husband by the name of Stan Zbornak.



## STATE => [[]]
## BEHAV => (())

# @ethnicity = String, @employed = Boolean, @widower = Boolean, @age = Range, 

# The [[girls]] live in a [[house]] with an [[address]] of 6151 Richmond Street Miami, FL. There are four [[inhabitants]] of the house:

# All of the girls are [[American]], except for Sofia-- she's {{Italian}}. All the girls ((work)), except for Sofia. All of them are [[widows]], except for Dorothy.

# - Only Dorothy stays home on Saturday evenings.
# - Only Rose has a long-term boyfriend.
# - Only Blanche dates younger men.
# - All of the girls are over 50.
# - Dorothy has an ex-husband by the name of Stan Zbornak.

class House
  attr_reader :address, :inhabitants

  def initialize(address)
    @address = address
    @inhabitants = []
  end
end

class Girl
  def initialize(name)
    @name = name
    @ethnicity
    @employed
    @widower
    @age
  end
end

house = House.new("6151 Richmond Street Miami, FL")

# - Dorothy Zbornak   American  employ-t  widow-f  age>50
dorothy = Girl.new("Dorothy Zbornak")
# - Blanche Deveraux  American  employ-t  widow-t  age>50
blanche = Girl.new("Blanche Deveraux")  
# - Rose Nylund       American  employ-t  widow-t  age>50  long-term-boy-T
rose = Girl.new("Rose Nylund")
# - Sofia Petrillo    Italian   employ-f  widow-t  age>50
sofia = Girl.new("Sofia Petrillo")

house.inhabitants << dorothy
house.inhabitants << blanche
house.inhabitants << rose
house.inhabitants << sofia

p house.address
p house.inhabitants


def dorothy.stays_home_sat_evenings?
  true
end

p dorothy.stays_home_sat_evenings?