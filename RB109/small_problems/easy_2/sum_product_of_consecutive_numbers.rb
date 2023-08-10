=begin
Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
=end

=begin
P_

E_
#example 1
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.
#example 2
>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

D_

A_  
  - print prompt about entering integer
  - prompt user to input integer
  - print prompt to input s or p
  - prompt user to enter s or p
      - if previous prompt was s => print sum of integers with statement
      - if previous prompt was p => print product of integers with statement
=end


puts ">> Please enter an integer greater than 0"
value = gets.chomp.to_i
puts ">> Enter 's' to computer the sum, 'p' to compute the product"
operation = gets.chomp

value_range = (1..value).to_a

if operation.downcase == 's'
  sum = value_range.sum
  puts "The sum of the integers between 1 and #{value} is #{sum}"
elsif operation.downcase == 'p'
  product = 1
  value_range.each {|n| product *= n }
  puts "The product of the integers between 1 and #{value} is #{product}"
end 