# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

## Problem
# input: array of integers
# output: an array of two integers
#
# explicit/implicit requirements:
# - always return pair of values in array
# - pass by value
# - closest -> difference between pairs of values is closest to 0
# - pairs of values don't have to consecutive
#
# clarifying questions?
# - input of two integers? 
#   - can return those two values
# - input of less than two? 
#   - return nil if less two
#
## Examples:
# The tests should print "true".
#
## Data Structure
# - Array: input
# - Array: output 
# - Integer: `difference` - value referencing the minimum difference
# - Integer: `counter` - dynamic variable with value referencing index positions for inner nested loop
#
## Algorithm - dynamic programming
# - Create a variable set to an empty array to store pairs of integers for output
# - Create a variable set to nil to store the minimum difference when subtracting element pairs
# - Each number in numbers
#   - Create a counter variable for inner loop
#   - Start nested loop and iteratate from integer after current element to the end of numbers
#   - Each next_number in nested loop
#     - Subtract current number from outer loop from next_number in nested loop
#     - Get absolute value of the difference
#     - If value difference variable is nil or is greater than the absolute value
#       - Replace difference with returned valuie
#       - Replace output array with array containing outer current number and inner current number
# - Return output array
# 
## Code with Intent
#

# def closest_numbers(numbers)

#   closest_pairs = []
#   difference = nil

#   numbers.each_with_index do |number, index|
    
#     counter = index + 1
#     loop do 
#       break if counter > numbers.length - 1
#       curr_difference = (number - numbers[counter]).abs
#       if difference == nil || curr_difference < difference
#         difference = curr_difference
#         closest_pairs = [number, numbers[counter]]
#       end
#       counter += 1
#     end
#   end
#   closest_pairs
# end

# [abs difference, [val1, val2]]

def closest_numbers(arr)
  storage = []
  arr.each_with_index do |num1, idx1|
    ((idx1 + 1)...arr.size).each do |idx2|
      num2 = arr[idx2]
      storage << [(num1-num2).abs, [num1, num2]]
    end
  end
  storage = storage.to_h
  storage[storage.keys.min]
end



p closest_numbers([5, 25, 15, 11, 20]) #== [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) #== [25, 27]
p closest_numbers([12, 7, 17]) #== [12, 7]


## time 25 min
