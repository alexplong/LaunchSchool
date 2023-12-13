=begin
Difficulty: easy

Given an integer n, find the maximal number you can obtain by deleting exactly one 
digit of the given number.

Example
  
  For n = 152, the output should be 52;

  For n = 1001, the output should be 101.

Constraints: 10 ≤ n ≤ 1000000.

input: an integer
output: an integer

RULES
- Given an integer
- Return the max number obtained by deletinig exactly one digit

ALGORITHM
- Given an integer
- Transform into an array of digits and reverse it
- Create a variable result and set it to an empty array
- Iterate through array with index
  - Remove element at curr index position from the array of digits
  - Join the new array after deleting digit to an intger and add to result array
- Return the max value from result array
=end

def delete_digit(num)
  num_arr = num.digits.reverse
  result = []

  num_arr.each_index do |idx|
    new_num = num_arr.dup
    new_num.delete_at(idx)
    result << new_num.join.to_i
  end

  result.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
