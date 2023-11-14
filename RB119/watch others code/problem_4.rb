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

Data Structures
Array: input - array of integers
Integer: output - max sum of contigoius subsequences


Algorithm
- Return 0 if all integers in array are less than 0 or if the array is empty
- Initialize variable to reference the sum and set to 0
- Each index position of number in numbers
  - Get a sub array from current element to the end
  - Each number in sub array (nested iteration)
    - Initialize an empty array
    - Push to array the sum of current nested value + previous in the array (or current only if array is empty)
  - Get max value from returned array
  - Reassign sum to max value if max value is greater than sum
- Return sum

=end

def max_sequence(arr)

  return 0 if arr.empty? || arr.all? {|n| n < 0}
  sum = 0

  arr.each_index do |i|

    sub_arr = arr.slice(i, arr.length)

    sub_arr = sub_arr.each_with_object([]) do |n, temp_sums|
      if temp_sums.empty?
        temp_sums << n
      else
        temp_sums << temp_sums.last + n
      end
    end

    sum = sub_arr.max if sub_arr.max > sum

  end
  sum

end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) #== 6
p max_sequence([11]) #== 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) #== 12

## time 30 +

=begin
input: an array of integers
output: an integer

Rules
Explicit:
- find maximum sum of a contiguous subsequence
- if all numbers are positive, max sum will be sum of whole array
- return 0 if array is empty OR array consists of only negatives 

Implicit:
- subsequence can be of any size, just get max sum from it

MENTAL MODEL
- Outer iterator keeps track of first element of subarr
- Inner iterator keeps track of last element to slice out to create subarr

DATA STRUCTURE
- 1 Array: input
- 1 Integer: output - dynamic variable we update

ALGORITHM
- return arr.sum if size of input arr is 1
- Initailize an output variable and set to 0
- Given an array of integers
- Iterate through input array with index - start_idx
  - Nested iteration from start_idx to length of input arr - 1 - end_indx
    - Get subarr from range start_idx to end_index inclusive
    - Reduce to get sum of array
    - Reassign output to reduced sum if reduced sum is greater than output
- Return output
=end

def max_sequence(arr)
  output = 0

  arr.each_index do |start_idx|
    (start_idx...arr.size).each do |end_idx|
      curr_sum = arr.slice(start_idx..end_idx).reduce(:+)
      output = curr_sum if curr_sum > output
    end
  end
  
  output
end

# find the max pair of contigious sequences
def max_pair(arr)
  output = nil
  max = 0 
  arr.each_index do |start_idx|
    output, max = [[arr[start_idx], arr[start_idx+1]], arr.slice(start_idx, 2).sum] if arr.slice(start_idx, 2).sum > max && arr.slice(start_idx, 2).size > 1
  end
  output
end

p max_pair([]) == 0
p max_pair([-2, 1, -3, 4, -1, 2, 1, -5, 4]) #== 6
p max_pair([11]) #== 11
p max_pair([32, 7]) #== 0
p max_pair([-2, 1, -7, 4, -10, 2, 1, 5, 4]) #== 12