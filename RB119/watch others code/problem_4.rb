require 'pry'
=begin
The maximum sum subarray problem consists of finding the maximum sum of a
contiguous subsequence in an array of integers:
maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4) --> should be 6: [4, -1, 2, 1]

Easy case is when the array is made up of only positive numbers and the maximum
sum is the sum of the whole array. 

If the array is made up of only negative numbers, return 0 instead.

Empty array is considered to have zero greatest sum, Note that the empty array
is also a valid subarray.
=end


=begin
Problem
- input: an array of integers
- output: an integer - the max of contiguous subsequences from input

requirements/clarifying questions
- all integers < 0 or an empty array can return 0
- at least 1 value required to return sum of subsequence
- want max sum of a contiguous subsequence
- 

Examples


Data Structures
Array: input - array of integers
Integer: output - max sum of contigoius subsequences


Algorithm
- Return 0 if all integers in array are less than 0 or if the array is empty
- Initialize variable to reference the sum and set to 0
- Each number in numbers
  - Nested iteration from current number to last in numbers
    - Get incremental sum of each element in a new array
  - Get max value from returned array
  - Reassgin sum to max value if max value is greater than sum
- Return sum




# - Iterate through number in numbers
#   - Initialize variable to reference temporary sum and set to 0
#   - Create a counter variable for the next element and set it to value of current index incremented by 1
#   - Break out of loop if next element is out of index range
#   - Next iteration if current element + next element is less than 0
#   - Reassign temporary sum to current element
#   - Start an until loop - continue the loop until: the next element returns nil or the sum of temporary sum and next element is less than tempory sum
#     - Increment tempory sum by by value of next element
#     - Increment counter variable for next element by 1
#   - Reassign sum to reference temporary sum value if temporary sum is greater than sum
# - return sum
=end

def max_sequence(arr)

  return 0 if arr.empty? || arr.all? {|n| n < 0}
  # return arr.sum if arr.length == 1

  sum = 0

  arr.each_with_index do |n, i|
    inner_counter = i + 1
    break if arr[inner_counter] == nil
    next if n + arr[inner_counter] < 0
    
    temp_sum = n

    until arr[inner_counter] == nil || temp_sum + arr[inner_counter] < temp_sum
      temp_sum += arr[inner_counter]
      inner_counter += 1
    end

    sum = temp_sum if temp_sum > sum
  end
  # binding.pry
  sum
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) #== 6
p max_sequence([11]) #== 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) #== 12