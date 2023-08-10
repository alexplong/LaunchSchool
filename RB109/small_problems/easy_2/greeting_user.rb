=begin
Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.
=end

=begin
P_
  INPUT: string with ! or without
  OUTPUT: two string variants dependent on ! present in string or not

  Rules
  - if ! is input - it has to be removed from output
E_
#example 1
What is your name? Bob
Hello Bob.

#example 2
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
D_

A_
  - print statement asking what is users name
  - prompt user to input name and store input in variable
  - check if user input contains ! char
    - if yes print all caps statement
    - if no print hello name


A_ ternary
  - add variable and set it to bool false
  - if input ends with ! we reassign variable to true
  - ternary assigns variable message proper string dependent on bool
=end

print "What is your name? "
name = gets.chomp

yell = false

# include? works but is not ideal since a ! can be anywhere
# we may want the ! to be only at the end
# if so, we use name[-1] == '!' instead of include method
# if name.include?('!')
# if name[-1] == '!'
#   puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

# my ternary solution
# if name[-1] == '!'
#   yell = true
# end
yell = true if name[-1] == "!"
message = (yell ? "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?" : "Hello #{name}.")
puts message

