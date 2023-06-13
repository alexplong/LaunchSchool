
def print_me
  puts  "I'm printing within the method!"
end

# print_me


def print_return_me
  "I'm printing the return value!"
end

# puts print_return_me


def print_hello
  "Hello"
end

def print_world
  "World"
end

# puts "#{print_hello} #{print_world}"

def greet
  "#{print_hello} #{print_world}"
end

# puts greet

def car(make, model)
  puts "#{make} #{model}"
end

# car('Toyota', 'Supra')

daylight = [true, false].sample
def time_of_day(light)
  if light then puts "it's daylight!" else  puts "it's nighttime!" end
  # if daylight
  #   puts "it's daylight!"
  # else
  #   puts "it's nighttime!"
  # end
end

# time_of_day(daylight)


def dog(name)
  return name
end

def cat(name)
  return name
end

# puts "The dog's name is #{dog('Spot')}."
# puts "The cat's name is #{cat('fuzzy')}."


def assign_name(name = "Bob")
  name
end

# puts assign_name('Kevin') == 'Kevin'
# puts assign_name == 'Bob'


def add(x, y)
  x + y
end

def multiply(x, y)
  x * y
end


# puts add(2, 2) == 4
# puts add(5, 4) == 9
# puts multiply(add(2, 2), add(5, 4)) == 36

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def sentence(name, activity)
  "#{name} went #{activity} today."
end

def name(arr)
  arr.sample
end

def activity(arr)
  arr.sample
end


# puts sentence(name(names), activity(activities))

# def meal
#   return 'Breakfast'
# end

# puts meal

# def meal
#   'Evening'
# end

# puts meal

# def meal
#   return 'Breakfast'
#   'Dinner'
# end

# puts meal

# def meal
#   puts 'Dinner'
#   return 'Breakfast'
# end

# puts meal

# def meal
#   'Dinner'
#   puts 'Dinner'
# end

# p meal

# def meal
#   return 'Breakfast'
#   'Dinner'
#   puts 'Dinner'
# end

# puts meal

def count_sheep
  5.times do |sheep|  # what is sheep local var referencing? maybe error? // ok jk times uses integer so local var references those #'s
    puts sheep
  end
end

# puts count_sheep  # nil on the return, so if no errors above then a bunch of nils?
# okay I was wrong it printed 0 thru 5

####### okayyyy so above is a bit tricky. 5.times should run 5 times so it should print 0 thru 4
####### if looking at #times in docs, after iterating 5 times, the method will return the initial integer > which is 5
####### since the method is the last "line" in the code block, the method returning a 5 gets returned
####### so the final 5 comes from the initial puts invoking the method call

# count_sheep # this will only print 0 thru 4

def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

# puts count_sheep

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return  # this will return a nil
    end
  end
end

# p count_sheep

def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number