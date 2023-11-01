require "pry"
=begin
Sum of Pairs

Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

Negative numbers and duplicate numbers can and will appear.

NOTE: There will also be lists tested of lengths upwards of 10,000,000 elements. Be sure your code doesn't time out.
=end

## Second Attempt
=begin
input: an array of integers and a single integer value
output: an array containing pair of integers or nil

RULES
Explicit:
- Parse/iterate through collection starting from left
- Pair of integers in returned array are contained in input array and both add up to equal the sum
- Array can contain more than 1 pair that adds up to sum
  - Pair whose second element has the smallest index is the solution
- If pairs of numbers can not be added to produce sum, return nil
- Negative numbers and duplicate numbers can appear in list
- List can contain upwards of 10,000,000 elements

Implicit:
- Pairs of numbers do not need to be contiguous

MENTAL MODEL
- Outer iterator to pass through whole array
- Inner iterator to pass from outer iterator through to the end of the array

DATA STRUCTURE
- Integer: dynamically updated to keep track of index of second element
- Array: output also dynamically updated conditionally

ALGORITHM
- Initialize a result variable and set to nil
- Initialize a variable second_index and set to nil
- Given an array of integers and a sum value
- Outer iterater to loop through array with outer index
  - Inner iterator to iterate from range (outer index + 1) to length of input array exclusively
    - Check if element at outer iterator and inner iterator added together equals sum AND if second_index is nil or if inner iterator is less than curent value of second_index
      - If that is also true
        - Then second_index is reassigned to value of inner iterator
        - result is reassigned to an array of [arr[outer iterator], arr[inner iterator]]
- Return result

=end


## Nested Iterative Method
# def sum_pairs(arr, n)
#   result = nil
#   second_index = nil

#   arr.each_index do |out_idx|
#     (out_idx+1...arr.length).each do |inner_idx|
#       if (arr[out_idx] + arr[inner_idx] == n) && (!second_index || inner_idx < second_index)
#         second_index = inner_idx
#         result = [arr[out_idx], arr[inner_idx]]
#         break
#       end
#     end
#   end
#   result
# end

# Initial attempt on Codewars resulted in a time-out from the long list test
# How to improve and optimize algorithm? - possible IRL scenario with very large list
# - Nested iteration definitely causing the slog down
#   - Technically, once second_index is reassigned the value of inner_idx
#   - Any next pair of numbers that add up to sum, the index of second element will be greater than current
#   - Therefore, in this conditional, after result and second_index are reassigned, can break from inner loop
#     - Adding break condition to break out of nested iteration did not help


## Saw a line on StackExchange and was reminded to take advantage of Ruby's built in methods
# Instead of performing two nested iterations, try to iterate only once
# In current interation, having first number and determining a value that is needed
# We can scan the rest of the collection for position of this needed value
# There's a method that returns the index of this number and we can compare this to the 
# Current lowest index value

# [3, 5, 2, 3, 7, 6]
#  ^        ^         # [0, 3]
#    [5, 2, 3, 7, 6]  # in new arr 3 is at pos 2
#           ^         # to get pos from orig arr, just add first el idx + 1

## Refactored with only single pass iteration
# - Given an array of integers and a sum value
# - Initialize a variable result and set to nil
# - Initialize a variable second index and set to size of input array + 1
# - Each integer of integers with index
#   - Get need value by subtracting current integer from sum
#   - Get next subarr by slicing input arr from range index + 1 to -1
#   - Get inner index of need value in next subarr
#   - Check if inner index is not nil and inner index + (index + 1) is less than second index
#   - If true, reassgin result to array [current number, need] and reassign second index to value of inner index
#   - break if index is greater than or equal to second index
#   - return result


def sum_pairs(arr, n)
  result = nil
  second_index = arr.size + 1

  arr.each_with_index do |curr_num, outer_idx|
    need = n - curr_num
    next_subarr = arr[outer_idx+1..-1]
    inner_idx = next_subarr.index(need)

    if !inner_idx.nil? && ((inner_idx + (outer_idx+1)) < second_index)
      second_index = inner_idx + outer_idx + 1
      result = [curr_num, need]
    end

    break if outer_idx > second_index
  end
  result
end


l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


p sum_pairs(l1, 8) == [1, 7]    #, "Basic: ["+l1.join(", ")+"] should return [1, 7] for sum = 8")
p sum_pairs(l2, -6) == [0, -6]  #, "Negatives: ["+l2.join(", ")+"] should return [0, -6] for sum = -6")
p sum_pairs(l3, -7) == nil      #, "No Match: ["+l3.join(", ")+"] should return nil for sum = -7")
p sum_pairs(l4, 2) == [1, 1]    #, "First Match From Left: ["+l4.join(", ")+"] should return [1, 1] for sum = 2 ")
p sum_pairs(l5, 10) == [3, 7]   #, "First Match From Left REDUX!: ["+l5.join(", ")+"] should return [3, 7] for sum = 10 ")
p sum_pairs(l6, 8) == [4, 4]    #, "Duplicates: ["+l6.join(", ")+"] should return [4, 4] for sum = 8")
p sum_pairs(l7, 0) == [0, 0]    #, "Zeroes: ["+l7.join(", ")+"] should return [0, 0] for sum = 0")
p sum_pairs(l8, 10) == [13, -3] #, "Subtraction: ["+l8.join(", ")+"] should return [13, -3] for sum = 10")
## 23 minutes







## First Attempt
=begin
input: array of integers
output: pair of integers in an array or nil

requirements/questions?
- return first two values in order of appearance that adds up to the sum
- if there are more than 1 pair of integers that add to sum, the pair with the second with lowest index is wanted
- return nil if none equal the sum

Mental Model
- 

Algorithm
- Create an output variable and set to empty array
- Create a variable to keep track of inside index set to nil
- Given an array of integers
- Each number in numbers with index i
  - Initiate a nested loop - next number in numbers with index j
    - next if current number + next number != sum
    - if inside index is nil or current nested index is less inside index 
      - then Update output array to a new array [curr number, next number] and update inside index variable to current nested index
- Return array if length is 2 otherwise return nil
=end

# def sum_pairs(ints, s)
  
#   output = []
#   inside_index = nil
  
#   ints.each_with_index do |n, i|

#     (i + 1).upto(ints.length - 1) do |j|
#       next if n + ints[j] != s
#       if inside_index == nil || j < inside_index
#         output = [n, ints[j]]
#         inside_index = j
#       end
#     end
#   end

#   if output.length == 2 
#      output
#   else
#      nil
#   end
# end

# l1= [1, 4, 8, 7, 3, 15]
# l2= [1, -2, 3, 0, -6, 1]
# l3= [20, -13, 40]
# l4= [1, 2, 3, 4, 1, 0]
# l5= [10, 5, 2, 3, 7, 5]
# l6= [4, -2, 3, 3, 4]
# l7= [0, 2, 0]
# l8= [5, 9, 13, -3]


# p sum_pairs(l1, 8) == [1, 7]    #, "Basic: ["+l1.join(", ")+"] should return [1, 7] for sum = 8")
# p sum_pairs(l2, -6) == [0, -6]  #, "Negatives: ["+l2.join(", ")+"] should return [0, -6] for sum = -6")
# p sum_pairs(l3, -7) == nil      #, "No Match: ["+l3.join(", ")+"] should return nil for sum = -7")
# p sum_pairs(l4, 2) == [1, 1]    #, "First Match From Left: ["+l4.join(", ")+"] should return [1, 1] for sum = 2 ")
# p sum_pairs(l5, 10) == [3, 7]   #, "First Match From Left REDUX!: ["+l5.join(", ")+"] should return [3, 7] for sum = 10 ")
# p sum_pairs(l6, 8) == [4, 4]    #, "Duplicates: ["+l6.join(", ")+"] should return [4, 4] for sum = 8")
# p sum_pairs(l7, 0) == [0, 0]    #, "Zeroes: ["+l7.join(", ")+"] should return [0, 0] for sum = 0")
# p sum_pairs(l8, 10) == [13, -3] #, "Subtraction: ["+l8.join(", ")+"] should return [13, -3] for sum = 10")

# 24 min
# alternative: create array of pairs first