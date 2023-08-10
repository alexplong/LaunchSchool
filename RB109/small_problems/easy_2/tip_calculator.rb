=begin
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.
=end

=begin
P_
  INPUTS: user input Numeric
  OUTPUT: Float interpolated in String output

  Rules:
  - enter tip % as whole number
E_
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

D_
  Numeric stored in variables
A_
  - print message to screen what is bill total
  - prompt user to input bill total
  - print message to screen what is tip percentage
  - prompt user to input tip percentage
  - convert tip percentage to decimal
  - calculate tip amount and store in variable
  - return String containing tip amount information
  - return String containing bill total

=end

print "=> What is the bill? "
bill = gets.to_f

print "=> What is the tip percentage? "
tip = gets.to_f
tip = tip / 100
tip_total = (bill * tip).round(2)
total = (bill + tip_total).round(2)
puts "The tip is $#{sprintf('%.2f', tip_total)}"
puts "The total is $#{sprintf( '%.2f',total)}"