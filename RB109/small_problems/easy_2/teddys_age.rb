=begin
Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

example output:
Teddy is 69 years old!
=end

=begin
P_
  INPUT: none
  OUTPUT: "Teddy is #{age} years old!"

  RULES:
  - age should be randomly generated value between 20 and 200


D_
  return an interpolated string to convert age Integer to String

A_
# initialize age variable and generate random number between 20 and 200
# return interpolated String with age variable


=end

def teddy_age
  puts "Enter your name: "
  name = gets.chomp
  if name == '' then name = "Teddy" end
  age = rand(20...200)
  puts "#{name} is #{age} years old!"
end

# p teddy_age
puts teddy_age

=begin
My solution uses the `Kernel#rand` method with a range (20..200) passed as an argument. 
The Integer referenced by age is passed as a variable in the interpolated string that's passed 
to puts as an argument.

To modify this program so that we can ask the user for a name while keeping Teddy as the default name. We'll first call the gets method which prompts for user input, and then chomp gets called and removes the newline character from the input and then store this value in a varaible.
We can then output the name and place the variable in the String where "Teddy" currently is
=end

