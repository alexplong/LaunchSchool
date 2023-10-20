# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# input: array of integers
# output: an array of integers - transform each element to value count of elements less than current element
#
# explicit/implicit requirements:
# - only count unique values - if two 2's in array, only count it once
# - array with one element will return [0]
#
# clarifying questions?
# - empty array returns []?
#
## Data Structures
# - Array: input un-mutated
# - Array: output - transformed copy
# - Array: array of unique elements
#
## Algorithm
# - create a variable to store output and set to reference an empty array
# - iterate through array: each number in numbers
#   - create copy of array of unique elements
#   - count number of elements in uniqued array that are less than each current number
#   - push count value to output array
# - return output array
#
## Time: 20 min


def smaller_numbers_than_current(numbers)

  numbers_smaller = []
  
  numbers.each do |number|
    numbers_smaller << numbers.uniq.count {|n| n < number}
  end

  numbers_smaller
end


p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".