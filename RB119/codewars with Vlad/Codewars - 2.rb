# You are given array of integers, your task will be to count all pairs in that array and return their count.

# Notes:

#     Array can be empty or contain only one value; in this case return 0
#     If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
#     Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

# Examples

[1, 2, 5, 6, 5, 2]  # -->  2
# ...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  # -->  4
# ...because there are 4 pairs: 2, 20, 6 and 2 (again)

=begin
# First Attempt
- input: an array of integers
- output: an integer

requirements/questions?
- count all pairs in the array
- return the count of all integers
- return 0 if array is empty or only contains only one value
- if there can be more than one pair available, count each pair only once

algorithm
- create a result variable and set to 0
- given an array of integers
- create a unique copy of input array
- iterate through unique copy array
  - count number of current integer in input array
  - divide the count by 2
  - add quotient value to result variable
- return result

=end

# def pairs(arr)
#   result = 0
#   uniq_arr = arr.uniq

#   uniq_arr.each do |n|
#     result += (arr.count(n) / 2)
#   end

#   result
# end

def pairs(arr)
  arr.uniq.map do |num|
    arr.count(num) / 2
  end.sum

end


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

## time 12 min
# explore possible options first before moving forward
# take your Time
# try things
# check count method


=begin
# Code Refactor
  
Algorithm:
  - initialise the local variable count_pairs to 0
  - iterate over unique values of the input arr
    - count the current number in the input array
    - perform an integer division by 2
    - increment count_pairs by the result of that division
  - return count pairs
=end

# def pairs(arr)

#   # More Readable Code Snippet
#   count_pairs = 0
#   arr.uniq.each { |num| count_pairs += (arr.count(num) / 2)}
#   count_pairs

#   # Code condensed to a single line
#   # use of sum method can be chained and iteratively sums up value returned by the block and returns it
#   # arr.uniq.sum { |num| arr.count(num) / 2 }
# end

# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# p pairs([1000, 1000]) == 1
# p pairs([]) == 0
# p pairs([54]) == 0