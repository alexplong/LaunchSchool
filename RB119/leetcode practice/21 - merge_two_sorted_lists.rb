=begin
You are given the heads of two sorted linked lists list1 and list2.
Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

Example 1:
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]

Example 2:
Input: list1 = [], list2 = []
Output: []

Example 3:
Input: list1 = [], list2 = [0]
Output: [0]


Constraints:
The number of nodes in both lists is in the range [0, 50].
-100 <= Node.val <= 100
Both list1 and list2 are sorted in non-decreasing order.
=end


=begin
- input: two array of integers
- output: an array

requirements/questions?
- pass by value
- heads? first in Ruby?
- arrays are sorted in increasing order
- return an empty array if both input arrays are empty
- length of two arrays may be different

mental model
- create an output variable set to empty array
- create counters to keep track of each element in each array
- initialize a loop
  - compare each of those elements
    - whichever is less than the other add that element to output array and increment that pointer
    - if both are equal add both elements to output and increment both counters
  - if one counter reaches end of its array stop increment that counter
  - break out of loop when output array size is equal to sum of both input array lengths
- return output array
examples
- all should return true

data structures
- Array: inputs
- Array: output

algorithm
- Initialize an output variable and set it to empty array
- Initialize counter1 and counter2 variable to track index positions and set to 0
- return output if arr1 and arr2 are empty
- return output + arr1 and arr2 if arr1 or arr2 is empty
- Invoke a loop
  - compare element returned from array1[counter1] to element returned from array2[counter2]
    - if equal, add both elements to output array and increment counter1 and counter2 by 1
    - elsif arr2[counter2] is nil OR if element at arr1[counter1] is less than arr2[counter2]
      - push element from arr1[counter1] to output and increment counter1 by 1
    - elsif arr1[counter1] is nil OR if element at arr2[counter2] is less than arr1[counter1]
      - push element from arr2[counter2] to output and increment counter1 by 1
  - break if length of output array is equal to sum of length of array1 and array2
- return the output array

code with intent
=end

def merge_two_lists(arr1, arr2)
  output = []
  counter1, counter2, = 0, 0

  return output + arr1 + arr2 if arr1.empty? || arr2.empty?

  loop do
    if arr1[counter1] == arr2[counter2]
      output.push(arr1[counter1], arr2[counter2])
      counter1 += 1
      counter2 += 1
    elsif arr2[counter2] == nil || arr1[counter1] < arr2[counter2]
      output << arr1[counter1]
      counter1 += 1
    elsif arr1[counter1] == nil || arr2[counter2] < arr1[counter1]
      output << arr2[counter2]
      counter2 += 1
    end
    break if output.length == (arr1.length + arr2.length)
  end
  output

end

p merge_two_lists([1,2,4], [1,3,4]) == [1, 1, 2, 3, 4, 4]
p merge_two_lists([], []) == []
p merge_two_lists([], [0]) == [0]

## Time 23 min