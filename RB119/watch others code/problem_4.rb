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
- Return 0 if all elements are < 0 or input is empty
- Initialize sum and set to 0
- Each number in numbers
  - Initialize curr sum and set to 0
  - Next iteration if curr element + next element is less than 0
  - Reassign curr sum to curr element + next element if returned value is greater than current sum
    - Until or while loop
      - Increment curr sum by + next element
    - Reassign sum to reference curr sum if curr sum is greater than sum
- return sum
=end

def max_sequence(arr)
  return 0 if arr.empty? || arr.all? {|n| n < 0}
  sum = 0

  arr.each_with_index do |n,i|
    inner_counter = i + 1
    next if n + arr[inner_counter] < 0
    
    curr_sum = 0
    curr_sum = n + arr[inner_counter]

    while inner_counter < arr.size
      inner_counter += 1
      break if curr_sum + arr[inner_counter] < curr_sum
      curr_sum += arr[inner_counter]
    end

    sum = curr_sum if curr_sum > sum

  end

  sum
end


p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12