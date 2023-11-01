=begin
Difficulty: easy

Given an integer n, find the maximal number you can obtain by deleting exactly one 
digit of the given number.

Example
  
  For n = 152, the output should be 52;

  For n = 1001, the output should be 101.

Constraints: 10 ≤ n ≤ 1000000.

=end
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
