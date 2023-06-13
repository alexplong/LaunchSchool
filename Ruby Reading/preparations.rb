# use pry for debugging
require "pry"

a = [1, 2, 3]

a << 4

binding.pry 
# execution will pause here, allowing for debugging such as inspection of all objects
# when it gets to line 8, a new pry session will open allowing for observation at what var a is in console
# better alternative than putting puts everywhere

puts a