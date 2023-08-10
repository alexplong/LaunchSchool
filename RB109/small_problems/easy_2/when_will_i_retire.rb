=begin
Build a program that displays when the user will retire and how many years she has to work till retirement.
=end

=begin
P_

E_
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

D_

A_
  - print statement asking about user age
  - prompt user to input age
  - convert age to integer
  - print statement asking about retirement age
  - promnpt user to input retirement age
  - convert retirement age to integer
  - identify current year and retirement year
  - print string containing current year and retirement year
  - print string containing difference between curr year and retire year


=end

print "What is your age? "
age = gets.to_i

print "At what age would you like to retire? "
retirement_age = gets.to_i

current_year = Time.now.year
work_years_to_go = retirement_age - age
retirement_year = current_year + (retirement_age - age)

puts "It's #{current_year}. You will retire in #{retirement_year}"
puts "You only have #{work_years_to_go} years of work to go!"