=begin

Write a function with the signature shown below:

def is_int_array(arr)
  true
end

- returns true if every element in an array is an integer or a float with no decimals.
- returns true if array is empty.
- returns false for every other input.

=end

##  expected input(s)
# input:  an array
# output: boolean value - true or false

##  requirements & rules
# three conditions to return true: every element is an integer or float with no decimals or array is empty
# condition to return false: else the above
# does 3.0 count as a decimal? it's technically a float without decimals, need to be .0 to be float
# an array with strings and other elements would return false, as would a string only

##  mental model
# - determine if the input is an array
# - check if the array is empty and return true if yes
# - check if every element is an integer or a float with no decimal
# - return false if element is not an integer or float with no decimal
# - otherwise return true 

## test cases
p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false

## data structure
# boolean expected as output

## algorithm
# 1. is current input an array?
#     1. Yes - do nothing
#     2. No - return false
# 2. is the array empty?
#     1. Yes - return true
#     2. No - do nothing
# 3. check every element in the array
#     1. is each element an Integer or a Float with no decimals?
#         1. Yes - return true
#         2. No - return false

def is_int_array(arr)
  return false unless arr.is_a?(Array)
  arr.empty? || arr.all? { |n| n.is_a?(Numeric) && n-n.to_i == 0}
end

