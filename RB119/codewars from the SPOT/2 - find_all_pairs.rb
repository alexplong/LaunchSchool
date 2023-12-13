=begin
Difficulty: medium

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:
Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. 
E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

=end


=begin
input: an array of integers
output: an integer

RULES
- Given an array of numbers
- Return the count of all pairs in the set
  - Count each pair only once, ie. [3, 3, 3] returns 1

ALGORITHM
- Given an array of integers
- Get an array of unique integers
- Iterate through the array to increment the result set to 0
  - Increment result by count of curr num in input array divided by 2
- Return the result
=end

def pairs(arr)
  arr.uniq.sum do |num|
    arr.count(num) / 2
  end
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

# iterate to count
