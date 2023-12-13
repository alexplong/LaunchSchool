# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.



## Problem
# input: an array of integers
# output: an integer
#
# explicit/implicit requirements:
# - nil returned if size of array is fewer than 5 elements
# - sum is minimum of 5 consecutive numbers
# - integers in array can be positive or negative
# clarifying questions?
# -
#
# Examples:
#
# - The tests above should print "true".
#
## Data Structures
# - Array: input
# - Integer: output
# - Array: of integers 
#
## Algorithm
# - if size of `arr` is less than 5 return `nil`
# - create a variable `output` and set to empty array
# - given an array `arr` of integers
# - iterate through the array
#   - break out of loop when return value element at current position + 5 is `nil`
#   - slice a sub array of 5 consecutive elements starting from current element passed into the block and get their sum
#   - append sum value to `output` array
# - return the minimum value from `output`
#
## Code with Intent
#

# def minimum_sum(arr)
#   return nil if arr.size < 5

#   output = []

#   arr.each_index do |idx|
#     break if arr[idx+5] == nil
#     output << arr[idx, 5].sum
#   end

#   output.min

# end

def minimum_sum(arr)
  return nil if arr.size < 5

  arr.map.with_index do |_, idx|
    subarr = arr.slice(idx, 5)
    subarr.size < 5 ? nil : subarr.sum
  end
  .compact.min

end


# p minimum_sum([1, 2, 3, 4]) #== nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) #== 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) #== 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) #== -10

# time 22 min


def minimum_sum(arr)
  return nil if arr.size < 5

  sums = []
  arr.each_index do |i|
    sub_arr = arr.slice(i, 5)
    break if sub_arr.size < 5

    sums << sub_arr.sum
  end

  sums.min
end



p minimum_sum([1, 2, 3, 4]) #== nil
p minimum_sum([1, 2, 3, 4, 5, 6]) #== 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) #== 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) #== -10